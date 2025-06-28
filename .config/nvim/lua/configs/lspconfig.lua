require("nvchad.configs.lspconfig").defaults()

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

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("lsp_attach_disable_ruff_hover", { clear = true }),
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client == nil then
      return
    end
    if client.name == "ruff" then
      -- Disable hover in favor of Pyright
      client.server_capabilities.hoverProvider = false
    end
  end,
  desc = "LSP: Disable hover capability from Ruff",
})

for name, opts in pairs(servers) do
  if not dont_enable[name] then
    vim.lsp.enable(name)
    vim.lsp.config(name, opts)
  end
end
