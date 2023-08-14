return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'kyazdani42/nvim-web-devicons', lazy = true },
    config = function()
      require('lualine').setup({
        sections = {
          lualine_c = { { 'filename', path = 1 } }
        },
        options = {
          theme = 'catppuccin',
          icons_enabled = true,
          globalstatus = false,
          disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
          always_divide_middle = true,
        },
      })
    end
  },
}
