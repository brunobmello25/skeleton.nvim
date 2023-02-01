return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'kyazdani42/nvim-web-devicons', lazy = true },
    config = require('config.ui.lualine').config
  },

  {
    "roberte777/keep-it-secret.nvim",
    config = require('config.ui.keep-it-secret').config
  },

  {
    'glepnir/dashboard-nvim',
    event = 'VimEnter',
    dependencies = { { 'kyazdani42/nvim-web-devicons' } },
    config = function()
      require('dashboard').setup({})
    end
  },

  {
    'NvChad/nvim-colorizer.lua',
    config = require('config.ui.colorizer').config
  },
}
