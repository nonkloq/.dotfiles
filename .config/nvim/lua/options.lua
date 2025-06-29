require "nvchad.options"

local o = vim.o

o.cursorlineopt = "both" -- to enable cursorline!

o.relativenumber = true
o.colorcolumn = "80"
o.termguicolors = true

vim.api.nvim_set_hl(0, "SnacksPickerDir", { link = "Comment" })
vim.api.nvim_set_hl(0, "SnacksPickerPathHidden", { link = "Comment" })
vim.api.nvim_set_hl(0, "SnacksPickerPathIgnored", { link = "Comment" })
vim.api.nvim_set_hl(0, "SnacksPickerGitStatusUntracked", { link = "Special" })

vim.api.nvim_set_hl(0, "SnacksPickerInputTitle", { link = "TelescopePromptTitle" })
vim.api.nvim_set_hl(0, "SnacksPickerTitle", { link = "TelescopePreviewTitle" })
vim.api.nvim_set_hl(0, "SnacksPickerFooter", { link = "TelescopeResultsTitle" })

-- not working
local function_hl = vim.api.nvim_get_hl(0, { name = "Function", link = false })
local function_fg = function_hl.fg and string.format("#%06x", function_hl.fg)

vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = function_fg, link = "Function" }) -- fallback for all
vim.api.nvim_set_hl(0, "TelescopePromptBorder", { fg = function_fg, link = "Function" }) -- prompt window
-- not working, but works after running it inside nvim using lua :!lua

vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { link = "Function" }) -- results list
vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { link = "Function" }) -- preview pane
