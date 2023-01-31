return {
  {
    'f-person/git-blame.nvim',
    init = require('config.git.gitblame').init
  },

  {
    'lewis6991/gitsigns.nvim',
    config = require('config.git.gitsigns').config
  },

  {
    'TimUntersberger/neogit',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = require('config.git.neogit').config
  }
}
