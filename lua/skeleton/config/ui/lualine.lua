local M = {}

function M.config()
  local layout = {
    lualine_a = {
      {
        function()
          return ""
        end,
        separator = { left = "", right = "" },
      },
    },
    lualine_b = {
      {
        "filetype",
        icon_only = true,
        colored = true,
        color = { bg = "", fg = "" },
      },
      {
        "filename",
        color = { bg = "", fg = "StatusLine" },
        separator = { left = "", right = "" },
      },
      {
        "branch",
        icon = "",
        color = { bg = "#81b29a", fg = "#242933" },
        separator = { left = "", right = "" },
      },
      {
        "diff",
        colored = true,
        symbols = {
          added = " ",
          modified = " ",
          removed = " ",
        },
        color = { bg = "#242933" },
        separator = { left = "", right = "" },
      },
    },
    lualine_c = {
      {
        function()
          return ""
        end,
        color = { bg = "#f4f1de", fg = "#121319" },
        separator = { left = "", right = "" },
      },
    },
    lualine_x = {
      function()
        local copilot_status = require('skeleton.utils.copilot_status')

        return copilot_status.get_status()
      end
    },
    lualine_y = {
      {
        "diagnostics",
        sources = { "nvim_lsp" },
        sections = {
          "info",
          "error",
          "warn",
          "hint",
        },
        diagnostic_color = {
          error = { fg = "#eb6f92", bg = "#0f111a" },
          warn = { fg = "DiagnosticWarn", bg = "#0f111a" },
          info = { fg = "DiaganosticInfo", bg = "#0f111a" },
          hint = { fg = "#9ccfd8", bg = "#0f111a" },
        },
        colored = true,
        update_in_insert = true,
        always_visible = false,
        symbols = {
          error = " ",
          warn = " ",
          hint = " ",
          info = " ",
        },
        separator = { left = "", right = "" },
      },
    },
    lualine_z = {
      {
        "progress",
        color = "StatusLine",
      },
      {
        function()
          return ""
        end,
        separator = { left = "", right = "" },
        color = { bg = "#D08770" },
      },
      {
        "location",
        color = "StatusLine",
      },
      {
        function()
          return ""
        end,
        separator = { left = "", right = "" },
        color = { bg = "#D08770" },
      },
    },
  }

  local no_layout = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  }

  require('lualine').setup({
    sections = layout,
    inactive_sections = no_layout,
    options = {
      icons_enabled = true,
      globalstatus = false,
      disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
      always_divide_middle = true,
    },
  })
end

return M
