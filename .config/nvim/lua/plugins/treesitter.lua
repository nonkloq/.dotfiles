return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  branch = "master",
  build = ":TSUpdate",
  opts = {
    auto_install = true,
    highlight = {
      enable = true,
      use_languagetree = true,
    },
    indent = { enable = true },
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
    require("nvim-treesitter.configs").setup(opts)
  end,
}
