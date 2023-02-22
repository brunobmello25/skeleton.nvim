return {
  {
    'f-person/git-blame.nvim',
    init = require('skeleton.config.git.gitblame').init
  },

  {
    'lewis6991/gitsigns.nvim',
    config = require('skeleton.config.git.gitsigns').config
  },

  {
    'TimUntersberger/neogit',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = require('skeleton.config.git.neogit').config
  }
}
