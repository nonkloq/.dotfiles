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
      config = function(_, opts)
        local cmp = require "cmp"
        table.insert(opts.sources, { name = "copilot", group_index = 2 })
        cmp.setup(opts)
      end,
    },
    {
      "CopilotC-Nvim/CopilotChat.nvim",
      dependencies = {
        { "zbirenbaum/copilot.lua" }, -- already included above
        { "nvim-lua/plenary.nvim" },
      },
      build = "make tiktoken", -- Only on MacOS or Linux
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
        { "<leader>cc", ":CopilotChatToggle<CR>", desc = "Copilot Chat" },
        { "<leader>ce", ":'<,'>CopilotChatExplain<CR>", mode = "v", desc = "Explain Code" },
        { "<leader>cf", ":'<,'>CopilotChatFix<CR>", mode = "v", desc = "Fix Code" },
        { "<leader>cm", ":'<,'>CopilotChat<CR>", mode = "v", desc = "Modify selected code" },
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
        "nvim-treesitter/nvim-treesitter",
        "stevearc/dressing.nvim",
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        --- The below dependencies are optional,
        -- "echasnovski/mini.pick", -- for file_selector provider mini.pick
        "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
        -- "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
        -- "ibhagwan/fzf-lua", -- for file_selector provider fzf
        -- "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
        "zbirenbaum/copilot.lua", -- for providers='copilot'
        {
          -- support for image pasting
          "HakonHarnes/img-clip.nvim",
          event = "VeryLazy",
          opts = {
            -- recommended settings
            default = {
              embed_image_as_base64 = false,
              prompt_for_file_name = false,
              drag_and_drop = {
                insert_mode = true,
              },
              -- required for Windows users
              use_absolute_path = true,
            },
          },
        },
        {
          -- Make sure to set this up properly if you have lazy=true
          "MeanderingProgrammer/render-markdown.nvim",
          opts = {
            file_types = { "markdown", "Avante" },
          },
          ft = { "markdown", "Avante" },
        },
      },
    },
  },
}
