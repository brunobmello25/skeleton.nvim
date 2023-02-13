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
    'zbirenbaum/copilot.lua',
    cmd = "Copilot",
    event = "InsertEnter",
    config = require('config.editing.copilot').config,
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

  -- TODO: change this to the original plugin after the fix-20 branch is merged
  {
    'j-hui/flit.nvim',
    dependencies = { 'ggandor/leap.nvim' },
    branch = 'fix-20',
    config = require('config.editing.flit').config,
  },

  {
    "kylechui/nvim-surround",
    config = require('config.editing.nvim_surround').config
  },

  {
    'kosayoda/nvim-lightbulb',
    dependencies = { 'antoinemadec/FixCursorHold.nvim' },
  }
}
