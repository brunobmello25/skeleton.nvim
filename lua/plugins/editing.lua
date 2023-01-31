return {
  {
    'windwp/nvim-autopairs',
    config = function() require("nvim-autopairs").setup({}) end
  },

  {
    'terrortylor/nvim-comment',
    dependencies = {
      {
        'JoosepAlviste/nvim-ts-context-commentstring',
        dependencies = { 'nvim-treesitter/nvim-treesitter' }
      }
    },
    config = require('config.editing.nvim_comment').config
  },

  {
    'github/copilot.vim',
    init = require('config.editing.copilot').init,
  },

  {
    "AckslD/nvim-neoclip.lua",
    dependencies = {
      { 'nvim-telescope/telescope.nvim' },
    },
    config = require('config.editing.neoclip').config,
  },

  -- autorun :noh when cursor moves
  { 'romainl/vim-cool' },

  {
    'windwp/nvim-ts-autotag',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function() require('nvim-ts-autotag').setup() end
  },

  { 'styled-components/vim-styled-components' },

  {
    'ggandor/leap.nvim',
    dependencies = { 'tpope/vim-repeat' },
    config = function()
      require('leap').add_default_mappings()
    end
  },

  {
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = require('config.editing.nvim_surround').config
  }
}
