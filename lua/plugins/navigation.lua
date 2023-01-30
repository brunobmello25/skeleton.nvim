return {
  {
    "nvim-telescope/telescope.nvim",
    version = false, -- telescope did only one release, so use HEAD for now
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = require('config.navigation.telescope').config
  },

  {
    {
      'ThePrimeagen/harpoon',
      dependencies = { 'nvim-lua/plenary.nvim' },
      config = require('config.navigation.harpoon').config,
    }
  },

  {
    'unblevable/quick-scope',
    init = require('config.navigation.quickscope').init
  },

  {
    'mrjones2014/smart-splits.nvim',
    config = require('config.navigation.smartsplits').config
  },

  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = require('config.navigation.todo_comments').config
  },

  { 'psliwka/vim-smoothie' },

  {
    'francoiscabrol/ranger.vim',
    dependencies = { 'rbgrouleff/bclose.vim' },
    init = require('config.navigation.ranger').init,
    config = require('config.navigation.ranger').config,
  }
}
