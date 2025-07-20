return {
  { "L3MON4D3/LuaSnip", keys = {} },
  {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
  {
    "saghen/blink.cmp",
    dependencies = { "rafamadriz/friendly-snippets" },
    version = "1.*",

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      snippets = { preset = "luasnip" },
      signature = { enabled = true },
      keymap = {
        preset = "default",
        ["<CR>"] = { "accept", "fallback" },
        ["<C><leader>"] = { "show" },
        ["<Tab>"] = { "select_next", "fallback" },
        ["<S-Tab>"] = { "select_prev", "fallback" },
      },
      appearance = {
        use_nvim_cmp_as_default = false,
        nerd_font_variant = "mono",
      },

      completion = {
        menu = {
          border = nil,
          scrolloff = 1,
          scrollbar = false,
          draw = {
            columns = {
              { "kind_icon" },
              { "label", "label_description", gap = 1 },
              { "kind" },
              -- { "source_name" },
            },
          },
        },
        documentation = {
          window = {
            border = "single",
            scrollbar = false,
            winhighlight = "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,EndOfBuffer:BlinkCmpDoc",
          },
          auto_show = true,
          auto_show_delay_ms = 300,
        },
      },
      cmdline = {
        enabled = false,
        completion = { menu = { auto_show = true } },
        keymap = {
          ["<CR>"] = { "accept_and_enter", "fallback" },
        },
      },

      sources = {
        default = { "lsp", "path", "snippets", "lazydev", "buffer" },
        providers = {
          cmdline = {
            min_keyword_length = 2,
          },
          lazydev = {
            name = "LazyDev",
            module = "lazydev.integrations.blink",
            -- make lazydev completions top priority (see `:h blink.cmp`)
            score_offset = 100,
          },
        },
      },
    },
    opts_extend = { "sources.default" },
    config = function(_, opts)
      require("blink.cmp").setup(opts)
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },
}
