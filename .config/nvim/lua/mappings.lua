require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<leader>td", "<cmd>TodoTelescope<CR>")

map("i", "<C-H>", "<C-W>", { noremap = true, desc = "Forget Word backword" })

-- Key mapping to trigger lspsaga commands
map("n", "<leader>lr", "<cmd>Lspsaga rename<CR>", { noremap = true, silent = true, desc = "Rename with Lspsaga" })
map(
  "n",
  "<leader>lo",
  "<cmd>Lspsaga outline<CR>",
  { noremap = true, silent = true, desc = "Show lspsaga code outline" }
)
map("n", "<leader>lh", "<cmd>Lspsaga hover_doc<CR>", { noremap = true, silent = true, desc = "Show Hover Doc" })
map(
  "n",
  "<leader>ld",
  "<cmd>Lspsaga diagnostic_jump_next<CR>",
  { noremap = true, silent = true, desc = "Go to Next Diagnostic" }
)
map(
  "n",
  "<leader>lD",
  "<cmd>Lspsaga diagnostic_jump_prev<CR>",
  { noremap = true, silent = true, desc = "Go to Previous Diagnostic" }
)
map("n", "<leader>lc", "<cmd>Lspsaga peek_definition<CR>", { noremap = true, silent = true, desc = "Peek Defention" })
map(
  "n",
  "<leader>lt",
  "<cmd>Lspsaga peek_type_definition<CR>",
  { noremap = true, silent = true, desc = "Peek Type Defenition" }
)
map("n", "<leader>la", "<cmd>Lspsaga code_action<CR>", { noremap = true, silent = true, desc = "View Code Action" })

-- Copilot
map(
  "n",
  "<leader>cs",
  "<cmd>lua require('copilot.suggestion').toggle_auto_trigger()<CR>",
  { noremap = true, silent = true, desc = "Toggle Copilot Auto Trigger" }
)
