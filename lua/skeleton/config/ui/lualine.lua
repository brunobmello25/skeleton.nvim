local M = {}

function M.config()
  require('lualine').setup({
    sections = {
      lualine_c = { { 'filename', path = 1 } }
    },
    options = {
      icons_enabled = true,
      globalstatus = false,
      disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
      always_divide_middle = true,
    },
  })
end

return M
