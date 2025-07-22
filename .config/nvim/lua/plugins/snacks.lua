local dbopts = {
  enabled = true,
  preset = {
    header = [[
                                                       
 󰘫            󰑃           󱁖      󰫤               󱁅 
  ███████╗  █████╗  ████████╗ ███████╗               
󱌮 ██╔════╝ ██╔══██╗ ╚══██╔══╝ ╚══███╔╝         󰄛      
  ███████╗ ███████║  󰆾 ██║    󰳽 ███╔╝              
  ╚════██║ ██╔══██║    ██║    ███╔╝                  
 ███████║ ██║  ██║   ██║    ███████╗              
  ╚══════╝ ╚═╝  ╚═╝    ╚═╝ 󰗧  ╚══════╝         󱍢   󰽱   
  󰘧  󱚣     󰣇                   ███████╗ ██╗ ███████╗
󱁊                  󰋔  pmo🥀    ╚══════╝ ╚═╝ ╚══════╝
   󰜈      󰺵       nonkloq.github.io   󱆃             
                                      󱐌        
                                                       ]],
  },
}

local file_picker_maps = {
  {
    "<leader><space>",
    function()
      Snacks.picker.smart()
    end,
    desc = "Picker Smart Find Files",
  },
  {
    "<leader>ff",
    function()
      Snacks.picker.files()
    end,
    desc = "Picker Search Files",
  },
  {
    "<leader>fb",
    function()
      Snacks.picker.buffers()
    end,
    desc = "Picker Search Buffers.",
  },
  {
    "<leader>fw",
    function()
      Snacks.picker.grep()
    end,
    desc = "Picker Search Live Grep",
  },
  {
    "<leader>fa",
    function()
      Snacks.picker.files {
        hidden = true,
        ignored = true,
        no_ignore_parent = true,
      }
    end,
    desc = "Picker Search All Files",
  },
  {
    "<leader>:",
    function()
      Snacks.picker.command_history()
    end,
    desc = "Picker Search Command History",
  },
  {
    "<leader>fe",
    function()
      Snacks.explorer()
    end,
    desc = "Picker Open File Explorer",
  },
  {
    "<leader>fc",
    function()
      Snacks.picker.files { cwd = vim.fn.stdpath "config" }
    end,
    desc = "Picker Search Config File",
  },
  {
    "<leader>fg",
    function()
      Snacks.picker.git_files()
    end,
    desc = "Picker Find Git Files (Files tracked by git)",
  },
  {
    "<leader>fp",
    function()
      Snacks.picker.projects()
    end,
    desc = "Picker Find Projects (git repos)",
  },
  {
    "<leader>fr",
    function()
      Snacks.picker.recent()
    end,
    desc = "Picker Find Recent files",
  },
}

local git_maps = {
  {
    "<leader>gb",
    function()
      Snacks.picker.git_branches()
    end,
    desc = "Git Branches",
  },
  {
    "<leader>gl",
    function()
      Snacks.picker.git_log()
    end,
    desc = "Git Log",
  },
  {
    "<leader>gL",
    function()
      Snacks.picker.git_log_line()
    end,
    desc = "Git Log Line",
  },
  {
    "<leader>gs",
    function()
      Snacks.picker.git_status()
    end,
    desc = "Git Status",
  },
  {
    "<leader>gS",
    function()
      Snacks.picker.git_stash()
    end,
    desc = "Git Stash",
  },
  {
    "<leader>gd",
    function()
      Snacks.picker.git_diff()
    end,
    desc = "Git Diff (Hunks)",
  },
  {
    "<leader>gf",
    function()
      Snacks.picker.git_log_file()
    end,
    desc = "Git Log File",
  },
  {
    "<leader>gB",
    function()
      Snacks.gitbrowse()
    end,
    desc = "Git Browse (open cursor in browser)",
    mode = { "n", "v" },
  },
  {
    "<leader>gg",
    function()
      Snacks.lazygit()
    end,
    desc = "Git Open Lazygit",
  },
}

local grep_maps = {
  {
    "<leader>sb",
    function()
      Snacks.picker.lines()
    end,
    desc = "GREP Search Buffer Lines",
  },
  {
    "<leader>sB",
    function()
      Snacks.picker.grep_buffers()
    end,
    desc = "GREP Grep Open Buffers",
  },
  {
    "<leader>sw",
    function()
      Snacks.picker.grep_word()
    end,
    desc = "GREP Visual selection or word",
    mode = { "n", "x" },
  },
}

local search_maps = {
  {
    '<leader>s"',
    function()
      Snacks.picker.registers()
    end,
    desc = "Search Registers",
  },
  {
    "<leader>s/",
    function()
      Snacks.picker.search_history()
    end,
    desc = "Search Search History",
  },
  {
    "<leader>sa",
    function()
      Snacks.picker.autocmds()
    end,
    desc = "Search autocmds",
  },
  {
    "<leader>sc",
    function()
      Snacks.picker.commands()
    end,
    desc = "Search Commands",
  },
  {
    "<leader>sd",
    function()
      Snacks.picker.diagnostics()
    end,
    desc = "Search Diagnostics",
  },
  {
    "<leader>sD",
    function()
      Snacks.picker.diagnostics_buffer()
    end,
    desc = "Search Buffer Diagnostics",
  },
  {
    "<leader>sh",
    function()
      Snacks.picker.help()
    end,
    desc = "Search Help Pages",
  },
  {
    "<leader>sH",
    function()
      Snacks.picker.highlights()
    end,
    desc = "Search Highlights",
  },
  {
    "<leader>si",
    function()
      Snacks.picker.icons()
    end,
    desc = "Search Icons",
  },
  {
    "<leader>sj",
    function()
      Snacks.picker.jumps()
    end,
    desc = "Search Jumps",
  },
  {
    "<leader>sk",
    function()
      Snacks.picker.keymaps {
        layout = {
          preset = "default",
          preview = false, -- disable preview pane
        },
      }
    end,
    desc = "Search Keymaps",
  },
  {
    "<leader>sl",
    function()
      Snacks.picker.loclist()
    end,
    desc = "Search Location List",
  },
  {
    "<leader>sm",
    function()
      Snacks.picker.marks()
    end,
    desc = "Search Marks",
  },
  {
    "<leader>sM",
    function()
      Snacks.picker.man()
    end,
    desc = "Search Man Pages",
  },
  {
    "<leader>sp",
    function()
      Snacks.picker.lazy()
    end,
    desc = "Search for Plugin Spec",
  },
  {
    "<leader>sq",
    function()
      Snacks.picker.qflist()
    end,
    desc = "Search Quickfix List",
  },
  {
    "<leader>sR",
    function()
      Snacks.picker.resume()
    end,
    desc = "Search Resume last op",
  },
  {
    "<leader>su",
    function()
      Snacks.picker.undo()
    end,
    desc = "Search Undo History",
  },
  {
    "<leader>st",
    function()
      Snacks.picker.todo_comments()
    end,
    desc = "Search Todo Comments",
  },
}

local lsp_maps = {
  {
    "gd",
    function()
      Snacks.picker.lsp_definitions()
    end,
    desc = "LSP Goto Definition",
  },
  {
    "gD",
    function()
      Snacks.picker.lsp_declarations()
    end,
    desc = "LSP Goto Declaration",
  },
  {
    "gr",
    function()
      Snacks.picker.lsp_references()
    end,
    nowait = true,
    desc = "LSP References",
  },
  {
    "gI",
    function()
      Snacks.picker.lsp_implementations()
    end,
    desc = "LSP Goto Implementation",
  },
  {
    "gy",
    function()
      Snacks.picker.lsp_type_definitions()
    end,
    desc = "LSP Goto T[y]pe Definition",
  },
  {
    "<leader>ss",
    function()
      Snacks.picker.lsp_symbols()
    end,
    desc = "Search LSP Symbols",
  },
  {
    "<leader>sS",
    function()
      Snacks.picker.lsp_workspace_symbols()
    end,
    desc = "Search LSP Workspace Symbols",
  },
}

local other_maps = {

  {
    "<leader>z",
    function()
      Snacks.zen()
    end,
    desc = "Snacks: Toggle Zen Mode",
  },
  {
    "<leader>Z",
    function()
      Snacks.zen.zoom()
    end,
    desc = "Snacks: Toggle Zoom",
  },
  {
    "<leader>.",
    function()
      Snacks.scratch()
    end,
    desc = "Snacks: Toggle Scratch Buffer",
  },
  {
    "<leader>S",
    function()
      Snacks.scratch.select()
    end,
    desc = "Search Scratch Buffer",
  },
  {
    "<leader>x",
    function()
      Snacks.bufdelete()
    end,
    desc = "Snacks: Delete Buffer",
  },
  {
    "<leader>cR",
    function()
      Snacks.rename.rename_file()
    end,
    desc = "Snacks: Rename File",
  },
  {
    "]]",
    function()
      Snacks.words.jump(vim.v.count1)
    end,
    desc = "Snacks: Next Reference",
    mode = { "n", "t" },
  },
  {
    "[[",
    function()
      Snacks.words.jump(-vim.v.count1)
    end,
    desc = "Snacks: Prev Reference",
    mode = { "n", "t" },
  },
  {
    "<leader>N",
    desc = "Snacks: Neovim News",
    function()
      Snacks.win {
        file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
        width = 0.6,
        height = 0.6,
        wo = {
          spell = false,
          wrap = false,
          signcolumn = "yes",
          statuscolumn = " ",
          conceallevel = 3,
        },
      }
    end,
  },
}

local function concat_lists(...)
  local result = {}
  for _, list in ipairs { ... } do
    for _, item in ipairs(list) do
      table.insert(result, item)
    end
  end
  return result
end

return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {

    dashboard = dbopts,
    animate = { enabled = true },
    bigfile = { enabled = true },
    explorer = { enabled = true },
    indent = {
      enabled = true,
      -- too colorful
      -- indent = {
      --   hl = {
      --     "SnacksIndent1",
      --     "SnacksIndent2",
      --     "SnacksIndent3",
      --     "SnacksIndent4",
      --     "SnacksIndent5",
      --     "SnacksIndent6",
      --     "SnacksIndent7",
      --     "SnacksIndent8",
      --   },
      -- },
    },
    input = { enabled = true, win = { width = 40, relative = "cursor", row = -3, col = 0 } },
    bufdelete = { enabled = true },
    -- vertical, vscode, telescope, ivy, ivy_split, select, left, right, dropdown, sidebar
    picker = { layout = { preset = "default" }, enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = true },
    words = { enabled = true },
    toggle = { enabled = true },
    image = { enabled = true },
    notifier = {
      enabled = true,
      timeout = 3000,
      top_down = false,
      margin = { top = 0, right = 1, bottom = 0 },
      style = "compact",
    },

    styles = {
      default = { border = "rounded" },
    },

    terminal = { enabled = false },
    statuscolumn = { enabled = false },
  },
  keys = concat_lists(file_picker_maps, git_maps, grep_maps, search_maps, lsp_maps, other_maps),
  init = function()
    vim.api.nvim_create_autocmd("User", {
      pattern = "VeryLazy",
      callback = function()
        -- Setup some globals for debugging (lazy-loaded)
        _G.dd = function(...)
          Snacks.debug.inspect(...)
        end
        _G.bt = function()
          Snacks.debug.backtrace()
        end
        vim.print = _G.dd -- Override print to use snacks for `:=` command

        -- Create some toggle mappings
        Snacks.toggle.option("spell", { name = "Spelling" }):map "<leader>us"
        Snacks.toggle.option("wrap", { name = "Wrap" }):map "<leader>uw"
        -- Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map "<leader>uL"
        Snacks.toggle.diagnostics():map "<leader>ud"
        -- Snacks.toggle.line_number():map "<leader>ul"
        Snacks.toggle
          .option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 })
          :map "<leader>uc"
        Snacks.toggle.treesitter():map "<leader>uT"

        Snacks.toggle.inlay_hints():map "<leader>uh"
        Snacks.toggle.indent():map "<leader>ug"
        Snacks.toggle.dim():map "<leader>uD"
      end,
    })
  end,
}
