local M = {
  { 'wbthomason/packer.nvim' },

  -- Completion and lsp
  { 'neovim/nvim-lspconfig' },
  { 'hrsh7th/nvim-cmp' },
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'hrsh7th/cmp-buffer' },
  { 'hrsh7th/cmp-path' },
  { 'hrsh7th/cmp-nvim-lua' },
  { 'onsails/lspkind.nvim' },
  { 'williamboman/nvim-lsp-installer', requires = { { 'neovim/nvim-lspconfig' } } },
  { 'saadparwaiz1/cmp_luasnip' },
  { 'L3MON4D3/LuaSnip' },

  -- Comments
  { "terrortylor/nvim-comment" },
  { "github/copilot.vim" },

  -- Colorscheme
  { "catppuccin/nvim", as = "catppuccin" },

  -- Status
  { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true } },

  -- quickscope
  { 'unblevable/quick-scope' },

  -- Fuzzy Finder
  { 'nvim-telescope/telescope.nvim', requires = { { 'nvim-lua/plenary.nvim' }, { 'folke/todo-comments.nvim' } } },

  -- Treesitter
  { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' },

  -- Harpoon
  { 'ThePrimeagen/harpoon', requires = { 'nvim-lua/plenary.nvim' } },

  -- Autoclose pairs
  { "windwp/nvim-autopairs" },

  -- autorun :noh when cursor moves
  { 'romainl/vim-cool' },

  -- Autorename and autoclose tags using treesitter
  { 'windwp/nvim-ts-autotag' },

  -- React plugins
  { 'styled-components/vim-styled-components' },

  -- Smooth scroll with ctrl+d/u
  { 'psliwka/vim-smoothie' },

  -- Formatting engine
  { 'sbdchd/neoformat' },

  -- used for git signs
  { 'mhinz/vim-signify' },

  -- change surrounding with cs command
  { 'tpope/vim-surround' },

  -- Debugging
  { 'mfussenegger/nvim-dap' }, -- base debug config
  { 'rcarriga/nvim-dap-ui' }, -- better debugging UI
  { 'Pocco81/dap-buddy.nvim' }, -- auto install debugging servers
  { 'leoluz/nvim-dap-go' }, -- debugger plugin for golang
  { 'theHamsta/nvim-dap-virtual-text' },

  -- Git
  { 'tpope/vim-fugitive' },
  { 'f-person/git-blame.nvim' },
  { 'akinsho/git-conflict.nvim' },

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
