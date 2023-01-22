local M = {
  { 'wbthomason/packer.nvim' },

  -- Treesitter
  { 'nvim-treesitter/nvim-treesitter', run = function()
    pcall(require('nvim-treesitter.install').update { with_sync = true })
  end
  },

  -- Completion and lsp
  {
    'neovim/nvim-lspconfig',
    requires = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      'j-hui/fidget.nvim',

      -- Additional lua configuration, makes nvim stuff amazing
      'folke/neodev.nvim',
    },
  },
  { 'yioneko/nvim-vtsls', requires = { 'neovim/nvim-lspconfig' } },

  { 'hrsh7th/nvim-cmp' },
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'hrsh7th/cmp-buffer' },
  { 'hrsh7th/cmp-path' },
  { 'hrsh7th/cmp-nvim-lua' },
  { 'onsails/lspkind.nvim' },
  { 'saadparwaiz1/cmp_luasnip' },
  { 'L3MON4D3/LuaSnip' },

  -- Comments
  { "terrortylor/nvim-comment" },
  { "github/copilot.vim" },
  { "JoosepAlviste/nvim-ts-context-commentstring", requires = { 'nvim-treesitter/nvim-treesitter' } },

  -- Colorscheme
  { "catppuccin/nvim", as = "catppuccin" },

  -- Status
  { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true } },

  -- quickscope
  { 'unblevable/quick-scope' },

  -- Fuzzy Finder
  { 'nvim-telescope/telescope.nvim', requires = { { 'nvim-lua/plenary.nvim' }, { 'folke/todo-comments.nvim' } } },

  -- Harpoon
  { 'ThePrimeagen/harpoon', requires = { 'nvim-lua/plenary.nvim' } },

  -- Autoclose pairs
  { "windwp/nvim-autopairs" },

  -- autorun :noh when cursor moves
  { 'romainl/vim-cool' },

  -- Autorename and autoclose tags using treesitter
  { 'windwp/nvim-ts-autotag', requires = { 'nvim-treesitter/nvim-treesitter' } },

  -- React plugins
  { 'styled-components/vim-styled-components' },

  -- Smooth scroll with ctrl+d/u
  { 'psliwka/vim-smoothie' },

  -- Formatting engine
  { 'sbdchd/neoformat' },

  -- change surrounding with cs command
  { 'tpope/vim-surround' },

  -- Debugging
  { 'mfussenegger/nvim-dap' }, -- base debug config
  { 'rcarriga/nvim-dap-ui' }, -- better debugging UI
  { 'Pocco81/dap-buddy.nvim' }, -- auto install debugging servers
  { 'leoluz/nvim-dap-go' }, -- debugger plugin for golang
  { 'theHamsta/nvim-dap-virtual-text' },

  -- Git
  { 'nvim-tree/nvim-web-devicons' },
  { 'tpope/vim-fugitive' },
  { 'f-person/git-blame.nvim' },
  { 'akinsho/git-conflict.nvim' },
  { 'sindrets/diffview.nvim', requires = { 'nvim-lua/plenary.nvim', 'nvim-tree/nvim-web-devicons' } },
  { 'mhinz/vim-signify' }, -- git signs
  { 'TimUntersberger/neogit' },

  -- neoclip - registers manager like a clipboard manager
  { "AckslD/nvim-neoclip.lua",
    requires = {
      { 'nvim-telescope/telescope.nvim' },
    }
  },

  -- Package manager (used to install debugger client)
  { "williamboman/mason.nvim" },

  -- Resize windows directionally based on the divider
  { 'mrjones2014/smart-splits.nvim' },

  -- File explorer
  {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }
}

return M
