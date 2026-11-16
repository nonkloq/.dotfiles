local prettier_types = {
  "javascript",
  "typescript",
  "javascriptreact",
  "typescriptreact",
  "css",
  "scss",
  "less",
  "html",
  "json",
  "jsonc",
  "yaml",
  "markdown",
  "markdown_inline",
  "graphql",
  "vue",
  "svelte",
  "astro",
  "toml",
}

local clang_types = {
  "c",
  "cpp",
  "objc",
  "objcpp",
  "h",
  "java",
}

local formatters_by_filetype = {
  lua = { "stylua" },
  python = {
    "ruff_fix", -- fix lint issues (--fix)
    "ruff_format", -- format code (`ruff format`)
    "ruff_organize_imports", -- sort imports
  },
  -- rust = {
  --   "rustfmt",
  -- },
}

for _, ft in ipairs(prettier_types) do
  formatters_by_filetype[ft] = { "prettierd" }
end

for _, ft in ipairs(clang_types) do
  formatters_by_filetype[ft] = { "clang_format" }
end

local user_defined_formatters = {
  rustfmt = {
    prepend_args = { "--config", "max_width=80" },
  },
  ruff_format = {
    command = "ruff",
    args = {
      "format",
      "--line-length",
      "80",
      "-",
    },
    stdin = true,
  },
}

local options = {
  formatters = user_defined_formatters,

  formatters_by_ft = formatters_by_filetype,
  format_on_save = function(bufnr)
    if vim.b[bufnr].disable_autoformat then
      return
    end
    -- These options will be passed to conform.format()
    return {
      timeout_ms = 10000,
      lsp_fallback = true,
    }
  end,
}

return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  opts = options,
  keys = {
    {
      "<leader>cf",
      function()
        require("conform").format { async = true, lsp_format = "fallback" }
      end,
      mode = "n",
      desc = "Format buffer",
    },
    {
      "<leader>cb",
      function()
        vim.b.disable_autoformat = not vim.b.disable_autoformat
        print("Format on save for this buffer: " .. (vim.b.disable_autoformat and "OFF" or "ON"))
      end,
      mode = "n",
      desc = "Toggle format on save for the buffer",
    },
  },
}
