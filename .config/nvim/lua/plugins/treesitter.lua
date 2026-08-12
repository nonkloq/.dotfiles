return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = { "neovim-treesitter/treesitter-parser-registry" },
  lazy = false,
  branch = "main",
  build = ":TSUpdate",
  opts = {
    -- auto_install = true,
    -- highlight = {
    --   enable = true,
    --   use_languagetree = true,
    -- },
    -- indent = { enable = false }, -- using snacks indent instead
    -- ensure_installed = {
    --   "vim",
    --   "lua",
    --   "vimdoc",
    --   "html",
    --   "css",
    --   "python",
    --   "rust",
    --   "markdown",
    --   "markdown_inline",
    -- },
  },
  init = function()
    local ensureInstalled = {
      "vim",
      "lua",
      "vimdoc",
      "html",
      "css",
      "python",
      "rust",
      "markdown",
      "markdown_inline",
    }
    local alreadyInstalled = require("nvim-treesitter.config").get_installed()
    local parsersToInstall = vim
      .iter(ensureInstalled)
      :filter(function(parser)
        return not vim.tbl_contains(alreadyInstalled, parser)
      end)
      :totable()
    require("nvim-treesitter").install(parsersToInstall)

    vim.api.nvim_create_autocmd("FileType", {
      callback = function()
        -- Enable treesitter highlighting and disable regex syntax
        pcall(vim.treesitter.start)
        -- Enable treesitter-based indentation
        -- vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
  config = function(_, opts)
    require("nvim-treesitter").setup(opts)
  end,
}
