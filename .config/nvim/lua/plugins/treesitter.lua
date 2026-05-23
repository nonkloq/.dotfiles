return {
  "neovim-treesitter/nvim-treesitter",
  dependencies = { "neovim-treesitter/treesitter-parser-registry" },
  lazy = false,
  -- branch = "master",
  build = ":TSUpdate",
  opts = {
    auto_install = true,
    highlight = {
      enable = true,
      use_languagetree = true,
    },
    indent = { enable = false }, -- using snacks indent instead
    ensure_installed = {
      "vim",
      "lua",
      "vimdoc",
      "html",
      "css",
      "python",
      "rust",
      "markdown",
      "markdown_inline",
    },
  },

  config = function(_, opts)
    require("nvim-treesitter").setup(opts)
  end,
}
