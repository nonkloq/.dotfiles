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
  ruff_format = {
    prepend_args = { "--line-length", "80" },
  },
  rustfmt = {
    prepend_args = { "--config", "max_width=80" },
  },
}

local options = {
  formatters = user_defined_formatters,

  formatters_by_ft = formatters_by_filetype,

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 10000,
    lsp_fallback = true,
  },
}

return options
