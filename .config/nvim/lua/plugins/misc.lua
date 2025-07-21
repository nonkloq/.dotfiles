return {
  -- theme
  { "catppuccin/nvim", name = "catppuccin", priority = 1000, opts = { flavour = "mocha" } },

  -- pretty document
  {
    "MeanderingProgrammer/render-markdown.nvim",
    lazy = false,
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
    opts = {
      completions = { blink = { enabled = true } },
      file_types = { "markdown", "Avante" },
    },
    ft = { "markdown", "Avante" },
  },

  -- view jupyter notebooks in nvim
  {
    "GCBallesteros/jupytext.nvim",
    config = true,
    -- Depending on your nvim distro or config you may need to make the loading not lazy
    -- lazy=false,
  },

  -- edit org files in nvim
  {
    "nvim-orgmode/orgmode",
    event = "VeryLazy",
    ft = { "org" },
    opts = {},
  },

  -- todo commment highlighting
  {
    "folke/todo-comments.nvim",
    lazy = false,
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function(_, opts)
      require("todo-comments").setup(opts)
    end,
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },

  -- auto paran completes
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {},
  },

  -- terminal inside nvim
  {
    {
      "akinsho/toggleterm.nvim",
      version = "*",
      opts = {
        start_in_insert = true,
        close_on_exit = true,
        shade_terminals = false,
      },
    },
  },

  -- preview colors
  {
    "catgoose/nvim-colorizer.lua",
    opts = {
      filetypes = { "*" },
      buftypes = {}, -- Buftype options.  Accepts table like `user_default_options`
      -- Boolean | List of usercommands to enable.  See User commands section.
      user_commands = true, -- Enable all or some usercommands
      lazy_load = false, -- Lazily schedule buffer highlighting setup function
      user_default_options = {
        RGB = true, -- #RGB hex codes
        RRGGBB = true, -- #RRGGBB hex codes #00ff00
        names = true, -- "Name" codes like Blue
        RRGGBBAA = false, -- #RRGGBBAA hex codes #00ff00aa
        rgb_fn = false, -- CSS rgb() and rgba() functions
        hsl_fn = false, -- CSS hsl() and hsla() functions
        css = false, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn = false, -- Enable all CSS *functions*: rgb_fn, hsl_fn
        -- Available modes: foreground, background
        mode = "virtualtext", -- Set the display mode
        -- Virtualtext character to use
        virtualtext = "",
        -- Display virtualtext inline with color.  boolean|'before'|'after'.  True sets to 'after'
        virtualtext_inline = "before",
        -- Virtualtext highlight mode: 'background'|'foreground'
        virtualtext_mode = "foreground",
        hooks = {
          -- called before line parsing.  Accepts boolean or function that returns boolean
          -- see hooks section below
          disable_line_highlight = false,
        },
      },
    },
  },

  -- just to learn motion
  {
    "m4xshen/hardtime.nvim",
    lazy = false,
    opts = { enabled = false },
  },

  -- extensive rust support
  {
    "mrcjkb/rustaceanvim",
    version = "^6", -- Recommended
    lazy = false, -- This plugin is already lazy
  },
}
