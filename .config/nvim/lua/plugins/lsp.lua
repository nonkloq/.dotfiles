local mason_ensure_installed = {
  "css-lsp",
  "html-lsp",
  "lua-language-server",
  "stylua",
  "ruff",
  "prettierd",
  "clang-format",
  "eslint-lsp",
  "rust-analyzer",
  "pylyzer",
  "pyright",
  "python-lsp-server",
  "clangd",
}

local dont_enable = {
  -- pyright = true,
  pylsp = true,
  -- ruff = true,
}

-- read :h vim.lsp.config for changing options of lsp servers
local servers = {
  html = {},
  cssls = {},
  ts_ls = {},
  lua_ls = {},
  eslint = {},
  rust_analyzer = {},
  clangd = {},

  pyright = {
    settings = {
      disableOrgaizeImports = false,
      python = {
        analysis = {
          typeCheckingMode = "basic",
          autoImportCompletions = true,
          autoSearchPaths = true,
          diagnosticMode = "openFilesOnly", -- "openFilesOnly", -- "workspace",
        },
      },
    },
  },

  pylsp = {},

  ruff = {
    init_options = {
      settings = {
        lineLength = 80,
        fixAll = true,
        organizeImports = true,
        prioritizeFileConfiguration = true,
        args = {
          "--extend-select=W,COM,ICN",
          "--ignore=E501,E722,COM812,F821",
        },
      },
    },
  },
}

return {
  {
    "mason-org/mason.nvim",
    opts = {
      max_concurrent_installers = 10,
      ui = {
        icons = {
          package_pending = " ",
          package_installed = " ",
          package_uninstalled = " ",
        },
      },
      servers = servers,
    },
    config = function(_, opts)
      require("mason").setup { opts }

      -- setup all servers
      for name, sopts in pairs(opts.servers) do
        if not dont_enable[name] then
          vim.lsp.config(name, sopts)
          vim.lsp.enable(name)
        end
      end
    end,
    dependencies = {
      "mason-org/mason-lspconfig.nvim",

      "neovim/nvim-lspconfig",

      { "WhoIsSethDaniel/mason-tool-installer.nvim", opts = { ensure_installed = mason_ensure_installed } },
    },
  },
  {
    "nvimdev/lspsaga.nvim",
    config = function()
      require("lspsaga").setup {
        lightbulb = {
          enable = false,
          virtual_text = false,
        },
      }
    end,
    dependencies = {
      "nvim-treesitter/nvim-treesitter", -- optional
      "nvim-tree/nvim-web-devicons", -- optional
    },
    event = "LspAttach",
  },
}
