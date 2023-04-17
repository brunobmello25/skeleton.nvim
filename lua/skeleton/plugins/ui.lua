return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'kyazdani42/nvim-web-devicons', lazy = true },
    config = require('skeleton.config.ui.lualine').config
  },

  {
    "folke/zen-mode.nvim",
    config = require("skeleton.config.ui.zenmode").config
  }
}
