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
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = require('skeleton.config.navigation.todo_comments').config
  },

  { 'psliwka/vim-smoothie' },

  {
    'kevinhwang91/rnvimr',
    init = require('skeleton.config.navigation.ranger').init,
    config = require('skeleton.config.navigation.ranger').config,
  },

  {
    'christoomey/vim-tmux-navigator',
    config = function()
      vim.keymap.set('n', '<C-h>', "<cmd>TmuxNavigateLeft<cr>", { desc = "move to left window" })
      vim.keymap.set('n', '<C-j>', "<cmd>TmuxNavigateDown<cr>", { desc = "move to down window" })
      vim.keymap.set('n', '<C-k>', "<cmd>TmuxNavigateUp<cr>", { desc = "move to up window" })
      vim.keymap.set('n', '<C-l>', "<cmd>TmuxNavigateRight<cr>", { desc = "move to right window" })
    end
  }
}
