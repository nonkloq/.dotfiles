local map = vim.keymap.set

map("n", "<C-n>", ":NvimTreeToggle<CR>", { noremap = true, silent = true, desc = "Toggle File Explorer" })

-- tabufline | buffer handles
map("n", "<Tab>", "<Cmd>BufferLineCycleNext<CR>", { noremap = true, silent = true, desc = "buffer goto next" })
map("n", "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", { noremap = true, silent = true, desc = "buffer goto prev" })

map("n", "<leader>tn", ":tabnew<CR>", { noremap = true, silent = true, desc = "New tab" })
map("n", "<leader>tc", ":tabclose<CR>", { noremap = true, silent = true, desc = "Close tab" })
map("n", "<leader>to", ":tabonly<CR>", { noremap = true, silent = true, desc = "Close all other tabs" })
map("n", "<leader>tl", ":tabnext<CR>", { noremap = true, silent = true, desc = "Next tab" })
map("n", "<leader>th", ":tabprevious<CR>", { noremap = true, silent = true, desc = "Previous tab" })
-- Go to specific tab number (1-9)
for i = 1, 9 do
  map("n", "<leader>" .. i .. "t", i .. "gt", { noremap = true, silent = true, desc = "Go to tab " .. i })
end

-- map("n", "<leader>b", "<cmd>enew<CR>", {noremap = true, silent = true, desc = "buffer new" })
-- map("n", "<leader>x", "<cmd>bd<CR>", {noremap = true, silent = true, desc = "buffer close current" }) -- using snacks buffer delete instead
map(
  "n",
  "<leader>bx",
  "<Cmd>BufferLineCloseOthers<CR>",
  { noremap = true, silent = true, desc = "buffer close others except current" }
)

map(
  "n",
  "<leader>bgt",
  "<Cmd>BufferLineGroupToggle Tests<CR>",
  { noremap = true, silent = true, desc = "buffer group toggle tests" }
)
map(
  "n",
  "<leader>bgd",
  "<Cmd>BufferLineGroupToggle Docs<CR>",
  { noremap = true, silent = true, desc = "buffer group toggle docs" }
)
map(
  "n",
  "<leader>bgu",
  "<Cmd>BufferLineGroupToggle ungrouped<CR>",
  { noremap = true, silent = true, desc = "buffer group toggle ungrouped" }
)

-- comments
map("n", "<leader>/", "gcc", { noremap = true, silent = true, desc = "toggle comment", remap = true })
map("v", "<leader>/", "gc", { noremap = true, silent = true, desc = "toggle comment", remap = true })

map("n", "<Esc>", "<cmd>noh<CR>", { noremap = true, silent = true, desc = "Remove highlights" })

-- terminal
local Terminal = require("toggleterm.terminal").Terminal
local horizontal, vertical, floating, tabbed

map({ "n", "t" }, "<M-o>", function()
  if not horizontal then
    horizontal = Terminal:new { direction = "horizontal", display_name = "hterm", hidden = true }
  end
  horizontal:toggle()
end, { desc = "Toggle Horizontal terminal" })

map({ "n", "t" }, "<M-v>", function()
  if not vertical then
    vertical = Terminal:new { direction = "vertical", display_name = "vterm", hidden = true }
  end
  vertical:toggle()
end, { desc = "Toggle Vertical terminal" })

map({ "n", "t" }, "<M-i>", function()
  if not floating then
    floating = Terminal:new { direction = "float", display_name = "fterm", hidden = true }
  end
  floating:toggle()
end, { desc = "Toggle Floating terminal" })

map({ "n", "t" }, "<M-t>", function()
  if not tabbed then
    tabbed = Terminal:new { direction = "tab", display_name = "tterm", hidden = true }
  end
  tabbed:toggle()
end, { desc = "Toggle Tab terminal" })
-- map(
--   { "n", "t" },
--   "<M-h>",
--   ":TermNew layout=below<CR>",
--   { noremap = true, silent = true, desc = "Terminal: Toggle horizontal terminal" }
-- )
-- map(
--   { "n", "t" },
--   "<M-v>",
--   ":TermNew layout=right<CR>",
--   { noremap = true, silent = true, desc = "Terminal: Toggle vertical terminal" }
-- )
-- map(
--   { "n", "t" },
--   "<M-i>",
--   ":TermNew layout=float<CR>",
--   { noremap = true, silent = true, desc = "Terminal: Toggle floating terminal" }
-- )
-- map({ "n", "t" }, "<M-t>", ":TermNew layout=tab<CR>", { noremap = true, silent = true, desc = "Toggle terminal tab" })
--
-- map("n", "<leader>sT", ":TermSelect<CR>", { noremap = true, silent = true, desc = "Terminal: Select terminal" })
--
-- map(
--   "n",
--   "<leader>cs",
--   ":TermSend! new_line=false<CR>",
--   { noremap = true, silent = true, desc = "Terminal: Send line (no newline)" }
-- )
-- map(
--   "x",
--   "<leader>cs",
--   ":TermSend! new_line=false<CR>",
--   { noremap = true, silent = true, desc = "Terminal: Send selection (no newline)" }
-- )
--
-- map(
--   "n",
--   "<leader>cx",
--   ":TermSend! action=visible<CR>",
--   { noremap = true, silent = true, desc = "Terminal: Execute in terminal, keep focus" }
-- )
-- map(
--   "x",
--   "<leader>cx",
--   ":TermSend! action=visible<CR>",
--   { noremap = true, silent = true, desc = "Terminal: Execute selection in terminal, keep focus" }
-- )
--
-- map(
--   "n",
--   "<leader>cS",
--   ":TermSend! action=visible trim=false decorator=markdown_code<CR>",
--   { noremap = true, silent = true, desc = "Terminal: Send as markdown code block" }
-- )
-- map(
--   "x",
--   "<leader>cS",
--   ":TermSend! action=visible trim=false decorator=markdown_code<CR>",
--   { noremap = true, silent = true, desc = "Terminal: Send selection as markdown code block" }
-- )

-- keybinding when in terminal
map("t", "<Esc>", [[<C-\><C-n>]], { noremap = true, silent = true, desc = "Switch to normal mode" })
map("t", "<C-w>h", [[<C-\><C-n><C-w>h]], { silent = true })
map("t", "<C-w>j", [[<C-\><C-n><C-w>j]], { silent = true })
map("t", "<C-w>k", [[<C-\><C-n><C-w>k]], { silent = true })
map("t", "<C-w>l", [[<C-\><C-n><C-w>l]], { silent = true })
map("t", "<C-w><C-w>", [[<C-\><C-n><C-w><C-w>]], { silent = true })

-- toggle colorizer
map("n", "<leader>ct", ":ColorizerToggle<CR>", { noremap = true, silent = true, desc = "Toggle colorizer" })

-- toggle hardtime
map("n", "<leader>ht", ":Hardtime toggle<CR>", { noremap = true, silent = true, desc = "Toggle Hardtime" })

-- Key mapping to trigger lspsaga commands
map("n", "<leader>cr", "<cmd>Lspsaga rename<CR>", { noremap = true, silent = true, desc = "LSP Rename with Lspsaga" })
map(
  "n",
  "<leader>lo",
  "<cmd>Lspsaga outline<CR>",
  { noremap = true, silent = true, desc = "LSP Show lspsaga code outline" }
)
map("n", "K", "<cmd>Lspsaga hover_doc<CR>", { noremap = true, silent = true, desc = "LSP Show Hover Doc" })
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
map("n", "<leader>la", "<cmd>Lspsaga code_action<CR>", { noremap = true, silent = true, desc = "LSP View Code Action" })
