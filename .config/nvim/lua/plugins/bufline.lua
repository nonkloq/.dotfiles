return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    require("bufferline").setup {
      highlights = {
        fill = {
          bg = "#1e1e2e", -- base
        },
      },
      -- see `:h bufferline-configuration` for more configs
      options = {
        mode = "buffers",
        themable = false,
        always_show_bufferline = false,
        auto_toggle_bufferline = true,
        separator_style = "thin",
        diagnostics = "nvim_lsp",
        offsets = {
          {
            filetype = "NvimTree",
            text = "",
            text_align = "center",
            separator = false,
          },
        },
        hover = {
          enabled = true,
          delay = 200,
          reveal = { "close" },
        },

        groups = {
          options = {
            toggle_hidden_on_enter = true,
          },
          items = {
            {

              name = "Tests",
              icon = " ",
              auto_close = true,
              -- highlight = { underline = true, sp = "red" }, -- Optional
              priority = 2, -- determines where it will appear relative to other groups (Optional)
              matcher = function(buf) -- Mandatory
                return buf.path:match "%_test" or buf.path:match "%_spec" or buf.path:match "/test[^/]*$"
              end,
            },
            {
              name = "Docs",
              auto_close = true,
              -- highlight = { undercurl = true, sp = "blue" },
              matcher = function(buf)
                return buf.path:match "%.md" or buf.path:match "%.txt"
              end,
              separator = { -- Optional
                style = require("bufferline.groups").separator.tab,
              },
            },
          },
        },
      },
    }
  end,
}
