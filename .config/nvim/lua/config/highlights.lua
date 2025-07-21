-- make the line numbers little brighter
vim.api.nvim_set_hl(0, "LineNr", { link = "Comment" })
vim.api.nvim_set_hl(0, "CursorLineNr", { link = "@text" })
vim.api.nvim_set_hl(0, "LineNrAbove", { link = "Comment" })
vim.api.nvim_set_hl(0, "LineNrBelow", { link = "Comment" })

-- to make the snacks ghost texts visible
vim.api.nvim_set_hl(0, "SnacksPickerDir", { link = "Comment" })
vim.api.nvim_set_hl(0, "SnacksPickerPathHidden", { link = "Comment" })
vim.api.nvim_set_hl(0, "SnacksPickerPathIgnored", { link = "Comment" })
vim.api.nvim_set_hl(0, "SnacksPickerGitStatusUntracked", { link = "Special" })

vim.api.nvim_set_hl(0, "SnacksPickerInputTitle", { link = "TelescopePromptTitle" })
vim.api.nvim_set_hl(0, "SnacksPickerTitle", { link = "TelescopePreviewTitle" })
vim.api.nvim_set_hl(0, "SnacksPickerFooter", { link = "TelescopeResultsTitle" })

-- remove bg highglight in diagnostics virtual text
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextOk", { link = "DiagnosticSignHint" })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextHint", { link = "DiagnosticSignInfo" })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextInfo", { link = "DiagnosticSignWarn" })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn", { link = "DiagnosticSignError" })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { link = "DiagnosticSignError" })

-- nvimtree window picker to show non highglighted pane
local txt_fg_color = vim.api.nvim_get_hl(0, { name = "Label" }).fg
vim.api.nvim_set_hl(0, "NvimTreeWindowPicker", {
  bg = "NONE",
  bold = true,
  ctermbg = 4,
  ctermfg = 15,
  fg = txt_fg_color,
})
