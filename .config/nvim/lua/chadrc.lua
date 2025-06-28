-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "catppuccin",
  theme_toggle = { "catppuccin", "chadracula-evondev", "gruvchad" },
  -- transparency = true,
  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
  },
}

M.nvdash = {
  load_on_startup = true,
  header = {

    "███╗   ██╗ ██████╗ ███╗   ██╗ ██████╗ ",
    "████╗  ██║██╔═══██╗████╗  ██║██╔═══██╗",
    "██╔██╗ ██║██║   ██║██╔██╗ ██║██║   ██║",
    "██║╚██╗██║██║   ██║██║╚██╗██║██║▄▄ ██║",
    "██║ ╚████║╚██████╔╝██║ ╚████║╚██████╔╝",
    "╚═╝  ╚═══╝ ╚═════╝ ╚═╝  ╚═══╝ ╚══▀▀═╝ ",
    "                                      ",
    "           nonkloq.github.io         ",
    "                                      ",
  },
}

M.ui = {
  cmp = {
    style = "flat_dark",
  },
  telescope = { style = "bordered" },
  statusline = { theme = "default", separator_style = "round" },

  tabufline = {
    lazyload = true,
  },
}

M.cheatsheet = {
  theme = "simple",
}

M.mason = {
  pkgs = {
    "css-lsp",
    "html-lsp",
    "lua-language-server",
    "stylua",
    "ruff",
    "prettierd",
    "clang-format",
    "eslint-lsp",
    "rust-analyzer",
    "pylyzer",
    "pyright",
    "python-lsp-server",
    "clangd",
  },
}

return M
