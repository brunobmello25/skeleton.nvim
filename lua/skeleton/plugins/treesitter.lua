return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = require('skeleton.config.editing.treesitter').config
  },

  {
    'nvim-treesitter/playground',
    dependencies = { 'nvim-treesitter/nvim-treesitter' }
  }
}
