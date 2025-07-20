local map = vim.keymap.set

map("n", "<C-n>", ":NvimTreeToggle<CR>", { desc = "Toggle File Explorer" })

-- tabufline | buffer handles
map("n", "<Tab>", "<Cmd>BufferLineCycleNext<CR>", { desc = "buffer goto next" })
map("n", "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", { desc = "buffer goto prev" })

map("n", "<leader>tn", ":tabnew<CR>", { desc = "New tab" })
map("n", "<leader>tc", ":tabclose<CR>", { desc = "Close tab" })
map("n", "<leader>to", ":tabonly<CR>", { desc = "Close all other tabs" })
map("n", "<leader>tl", ":tabnext<CR>", { desc = "Next tab" })
map("n", "<leader>th", ":tabprevious<CR>", { desc = "Previous tab" })
-- Go to specific tab number (1-9)
for i = 1, 9 do
  map("n", "<leader>" .. i .. "t", i .. "gt", { desc = "Go to tab " .. i })
end

-- map("n", "<leader>b", "<cmd>enew<CR>", { desc = "buffer new" })
-- map("n", "<leader>x", "<cmd>bd<CR>", { desc = "buffer close current" }) -- using snackx buffer delete instead
map("n", "<leader>bx", "<Cmd>BufferLineCloseOthers<CR>", { desc = "buffer close others except current" })

map("n", "<leader>bgt", "<Cmd>BufferLineGroupToggle Tests<CR>", { desc = "buffer group toggle tests" })
map("n", "<leader>bgd", "<Cmd>BufferLineGroupToggle Docs<CR>", { desc = "buffer group toggle docs" })
map("n", "<leader>bgu", "<Cmd>BufferLineGroupToggle ungrouped<CR>", { desc = "buffer group toggle ungrouped" })

-- comments
map("n", "<leader>/", "gcc", { desc = "toggle comment", remap = true })
map("v", "<leader>/", "gc", { desc = "toggle comment", remap = true })

map("n", "<Esc>", "<cmd>noh<CR>", { desc = "Remove highlights" })

-- terminal
local Terminal = require("toggleterm.terminal").Terminal

local horizontal = Terminal:new { direction = "horizontal", name = "hterm", size = 40, hidden = true }
local vertical = Terminal:new { direction = "vertical", name = "vterm", hidden = true }
local floating = Terminal:new { direction = "float", name = "fterm", hidden = true }
local tabbed = Terminal:new { direction = "tab", name = "tterm", hidden = true }
map({ "n", "t" }, "<M-h>", function()
  horizontal:toggle()
end, { desc = "Toggle Horizontal terminal" })
map({ "n", "t" }, "<M-v>", function()
  vertical:toggle()
end, { desc = "Toggle Vertical terminal" })
map({ "n", "t" }, "<M-i>", function()
  floating:toggle()
end, { desc = "Toggle Floating terminal" })
map({ "n", "t" }, "<M-t>", function()
  tabbed:toggle()
end, { desc = "Toggle Tab terminal" })

map("t", "<Esc>", [[<C-\><C-n>]], { noremap = true, silent = true, desc = "Switch to normal mode" })
map("t", "<C-w>h", [[<C-\><C-n><C-w>h]], { silent = true })
map("t", "<C-w>j", [[<C-\><C-n><C-w>j]], { silent = true })
map("t", "<C-w>k", [[<C-\><C-n><C-w>k]], { silent = true })
map("t", "<C-w>l", [[<C-\><C-n><C-w>l]], { silent = true })
map("t", "<C-w><C-w>", [[<C-\><C-n><C-w><C-w>]], { silent = true })

-- toggle colorizer
map("n", "<leader>ct", ":ColorizerToggle<CR>", { noremap = true, silent = true, desc = "Toggle colorizer" })

-- Key mapping to trigger lspsaga commands
map("n", "<leader>lsr", "<cmd>Lspsaga rename<CR>", { noremap = true, silent = true, desc = "LSP Rename with Lspsaga" })
map(
  "n",
  "<leader>lo",
  "<cmd>Lspsaga outline<CR>",
  { noremap = true, silent = true, desc = "LSP Show lspsaga code outline" }
)
map("n", "<leader>lh", "<cmd>Lspsaga hover_doc<CR>", { noremap = true, silent = true, desc = "LSP Show Hover Doc" })
map(
  "n",
  "<leader>ldn",
  "<cmd>Lspsaga diagnostic_jump_next<CR>",
  { noremap = true, silent = true, desc = "LSP Goto Next Diagnostic" }
)
map(
  "n",
  "<leader>ldp",
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
map(
  "n",
  "<leader>lsa",
  "<cmd>Lspsaga code_action<CR>",
  { noremap = true, silent = true, desc = "LSP View Code Action" }
)
