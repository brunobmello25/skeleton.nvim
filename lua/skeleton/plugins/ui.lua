return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'kyazdani42/nvim-web-devicons', lazy = true },
    config = require('skeleton.config.ui.lualine').config
  },

  {
    'glepnir/dashboard-nvim',
    event = 'VimEnter',
    dependencies = { { 'kyazdani42/nvim-web-devicons' } },
    config = require('skeleton.config.ui.dashboard').config
  },

  -- {
  --   'NvChad/nvim-colorizer.lua',
  --   config = require('skeleton.config.ui.colorizer').config
  -- },
}
