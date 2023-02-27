return {
  {
    "nvim-telescope/telescope.nvim",
    version = false, -- telescope did only one release, so use HEAD for now
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = require('skeleton.config.navigation.telescope').config
  },

  {
    {
      'ThePrimeagen/harpoon',
      dependencies = { 'nvim-lua/plenary.nvim' },
      config = require('skeleton.config.navigation.harpoon').config,
    }
  },

  {
    'mrjones2014/smart-splits.nvim',
    config = require('skeleton.config.navigation.smartsplits').config
  },

  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = require('skeleton.config.navigation.todo_comments').config
  },

  { 'psliwka/vim-smoothie' },

  {
    'kevinhwang91/rnvimr',
    init = require('skeleton.config.navigation.ranger').init,
    config = require('skeleton.config.navigation.ranger').config,
  }
}
