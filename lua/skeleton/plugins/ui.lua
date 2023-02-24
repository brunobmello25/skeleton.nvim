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

  {
    "folke/noice.nvim",
    config = require('skeleton.config.ui.noice').config,
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    }
  }
}
