return {
  {
    {
      "zbirenbaum/copilot.lua",
      cmd = "Copilot", -- lazy-load on command
      event = "InsertEnter", -- or load when entering insert mode
      config = function()
        require("copilot").setup {
          suggestion = { enabled = true, auto_trigger = false }, -- leader cs to toggle trigger
          -- panel = { enabled = false },
        }
      end,
    },
    {
      "hrsh7th/nvim-cmp",
      config = function(_, opts) -- updating defaults
        local cmp = require "cmp"
        table.insert(opts.sources, { name = "copilot", group_index = 2 })
        cmp.setup(opts)
      end,
    },
    {
      "CopilotC-Nvim/CopilotChat.nvim",
      dependencies = {
        { "zbirenbaum/copilot.lua" },
        { "nvim-lua/plenary.nvim" },
      },
      build = "make tiktoken",
      config = function()
        require("CopilotChat").setup {}
      end,
      cmd = {
        "CopilotChat",
        "CopilotChatToggle",
        "CopilotChatVisual",
        "CopilotChatExplain",
        "CopilotChatReview",
        "CopilotChatFix",
      },
      keys = {
        { "<leader>cc", ":CopilotChatToggle<CR>", desc = "Copilot Copilot Chat" },
        { "<leader>ce", ":'<,'>CopilotChatExplain<CR>", mode = "v", desc = "Copilot Explain Code" },
        { "<leader>cf", ":'<,'>CopilotChatFix<CR>", mode = "v", desc = "Copilot Fix Code" },
        { "<leader>cm", ":'<,'>CopilotChat<CR>", mode = "v", desc = "Copilot Modify selected code" },
      },
    },
    {
      "yetone/avante.nvim",
      event = "VeryLazy",
      version = false, -- Never set this value to "*"! Never!
      opts = {
        provider = "custom",
        providers = {
          custom = {
            __inherited_from = "openai",
            endpoint = os.getenv "CUSTOM_ENDPOINT",
            model = os.getenv "CUSTOM_MODEL",
            api_key_name = "CUSTOM_API_KEY",
            max_tokens = 4096,
            -- temperature = 0.1,
            stream = true,
          },
        },
      },
      build = "make",
      dependencies = {
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        "nvim-telescope/telescope.nvim", -- file_picker provider
        "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
        "nvim-tree/nvim-web-devicons", -- for icons
        "folke/snacks.nvim", -- for input provider snacks
        "zbirenbaum/copilot.lua", -- for providers='copilot'
      },
    },
  },
}
