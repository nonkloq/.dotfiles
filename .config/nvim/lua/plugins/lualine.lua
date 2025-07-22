return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons", "AndreM222/copilot-lualine" },
  opts = {

    theme = "auto",
    options = {
      -- use straight lines
      component_separators = { left = "│", right = "│" },
      section_separators = { left = "", right = "" },
      -- component_separators = { left = "", right = "" },
      -- section_separators = { left = "", right = "" },
    },

    sections = {
      lualine_a = { "mode" },
      lualine_b = {
        "branch",
        "diff",
        {
          "diagnostics",
          sources = { "nvim_diagnostic" },
          symbols = { error = " ", warn = " ", info = " ", hint = " " },
        },
      },
      lualine_c = { "filename", "searchcount", "selectioncount" },
      -- removed: "encoding", "fileformat"
      lualine_x = { "copilot", "lsp_status", "filetype" },
      lualine_y = { "progress" },
      lualine_z = { "location" },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { "filename", "searchcount", "selectioncount" },
      lualine_x = { "location" },
      lualine_y = {},
      lualine_z = {},
    },
    tabline = {},
    extensions = {},
  },
}
