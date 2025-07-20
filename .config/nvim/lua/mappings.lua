require "nvchad.mappings"

local map = vim.keymap.set

-- map("n", ";", ":", { desc = "CMD enter command mode" })
-- map("i", "jk", "<ESC>")

map("i", "<C-H>", "<C-W>")

map(
  "n",
  "<leader>td",
  "<cmd>TodoTelescope<CR>",
  { noremap = true, silent = true, desc = "Telescope Search TODO Comments" }
)

-- Key mapping to trigger lspsaga commands
map("n", "<leader>lr", "<cmd>Lspsaga rename<CR>", { noremap = true, silent = true, desc = "LSP Rename with Lspsaga" })
map(
  "n",
  "<leader>lo",
  "<cmd>Lspsaga outline<CR>",
  { noremap = true, silent = true, desc = "LSP Show lspsaga code outline" }
)
map("n", "<leader>lh", "<cmd>Lspsaga hover_doc<CR>", { noremap = true, silent = true, desc = "LSP Show Hover Doc" })
map(
  "n",
  "<leader>ld",
  "<cmd>Lspsaga diagnostic_jump_next<CR>",
  { noremap = true, silent = true, desc = "LSP Goto Next Diagnostic" }
)
map(
  "n",
  "<leader>lD",
  "<cmd>Lspsaga diagnostic_jump_prev<CR>",
  { noremap = true, silent = true, desc = "LSP Goto Previous Diagnostic" }
)
map(
  "n",
  "<leader>lc",
  "<cmd>Lspsaga peek_definition<CR>",
  { noremap = true, silent = true, desc = "LSP Peek Defention" }
)
map(
  "n",
  "<leader>lt",
  "<cmd>Lspsaga peek_type_definition<CR>",
  { noremap = true, silent = true, desc = "LSP Peek Type Defenition" }
)
map("n", "<leader>la", "<cmd>Lspsaga code_action<CR>", { noremap = true, silent = true, desc = "LSP View Code Action" })

-- Copilot
map(
  "n",
  "<leader>cs",
  "<cmd>lua require('copilot.suggestion').toggle_auto_trigger()<CR>",
  { noremap = true, silent = true, desc = "Copilot Toggle suggestion auto trigger" }
)

-- to replace some Telescope funcs with snacks.picker
vim.keymap.del("n", "<leader>ff")
vim.keymap.del("n", "<leader>fw")
vim.keymap.del("n", "<leader>fb")
vim.keymap.del("n", "<leader>fa")
map("n", "<leader>ff", function()
  Snacks.picker.files()
end, { desc = "Picker Search Files" })
map("n", "<leader>fb", function()
  Snacks.picker.buffers()
end, { desc = "Picker Search Buffers" })
map("n", "<leader>fw", function()
  Snacks.picker.grep()
end, { desc = "Picker Search Live Grep" })
map("n", "<leader>fa", function()
  Snacks.picker.files {
    hidden = true,
    ignored = true,
    no_ignore_parent = true,
  }
end, { desc = "Picker Search All Files" })

-- rustaceanvim
local bufnr = vim.api.nvim_get_current_buf()
map("n", "<leader>la", function()
  -- vim.cmd.RustLsp "codeAction" -- supports rust-analyzer's grouping
  vim.lsp.buf.codeAction() -- or if you don't want grouping.
end, { silent = true, buffer = bufnr })
map(
  "n",
  "K", -- Override Neovim's built-in hover keymap with rustaceanvim's hover actions
  function()
    vim.cmd.RustLsp { "hover", "actions" }
  end,
  { silent = true, buffer = bufnr }
)
