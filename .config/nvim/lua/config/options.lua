local o = vim.o

vim.g.mapleader = " " -- Set <Space> as the leader key
vim.g.maplocalleader = " " -- Set <Space> as the local leader
vim.g.have_nerd_font = true -- Enable Nerd Font support (for icons)

vim.g.loaded_netrw = 1 -- Disable netrw file explorer
vim.g.loaded_netrwPlugin = 1 -- Disable netrw plugin

o.termguicolors = true -- Enable true color support
vim.opt.termguicolors = true -- (redundant but safe to keep)

o.signcolumn = "yes" -- Always show sign column (for LSP, git, etc.)
o.cursorlineopt = "both" -- Highlight both the line and column under cursor
o.colorcolumn = "80" -- Highlight column 80 (code width guide)
o.cursorline = true -- Highlight the current line (default behavior)
o.laststatus = 3 -- keep single pane for all buffers
o.splitkeep = "screen" -- allows splits to keep the screen position when resizing

o.number = true -- Show absolute line number on current line
o.relativenumber = true -- Show relative line numbers for other lines
o.numberwidth = 2 -- Set number column width
o.ruler = false -- Disable the ruler (already handled in statusline)

o.mouse = "a" -- Enable mouse support
o.undofile = true -- Enable persistent undo
o.breakindent = true -- Preserve indentation on wrapped lines
o.scrolloff = 10 -- Minimum lines to keep above/below cursor
o.clipboard = "unnamedplus" -- sync system clipboard with nvim buffer

o.ignorecase = true -- Case-insensitive search by default
o.smartcase = true -- ...unless uppercase is used in search

o.showmode = false -- Don't show -- INSERT -- etc. (statusline should handle it)
o.updatetime = 250 -- Faster diagnostics update time
o.timeoutlen = 300 -- Shorter timeout for mapped sequences
o.inccommand = "split" -- Show live substitution preview in a split
o.confirm = true -- Prompt to save unsaved changes when closing

o.splitright = true -- Vertical splits open to the right
o.splitbelow = true -- Horizontal splits open below

o.list = true -- Show invisible characters
vim.opt.listchars = {
  tab = "» ",
  trail = "·",
  nbsp = "␣",
}
vim.opt.fillchars = { eob = " " }

-- disable nvim intro
vim.opt.shortmess:append "sI"

-- Indenting
o.expandtab = true
o.shiftwidth = 2
o.smartindent = true
o.tabstop = 2
o.softtabstop = 2

-- lsp and diagnostic
vim.diagnostic.config {
  -- virtual_lines = true,
  virtual_text = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    border = "rounded",
    source = true,
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "󰅚 ",
      [vim.diagnostic.severity.WARN] = "󰀪 ",
      [vim.diagnostic.severity.INFO] = "󰋽 ",
      [vim.diagnostic.severity.HINT] = "󰌶 ",
    },
    numhl = {
      [vim.diagnostic.severity.ERROR] = "ErrorMsg",
      [vim.diagnostic.severity.WARN] = "WarningMsg",
    },
  },
}
