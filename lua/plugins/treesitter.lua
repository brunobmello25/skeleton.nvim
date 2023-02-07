return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = require('config.editing.treesitter').config
  },

  {
    'nvim-treesitter/playground',
    dependencies = { 'nvim-treesitter/nvim-treesitter' }
  }
}
