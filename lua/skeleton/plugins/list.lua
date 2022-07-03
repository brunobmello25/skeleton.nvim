local M = {
  { 'wbthomason/packer.nvim' },

  -- Completion and lsp
  { 'neovim/nvim-lspconfig' },
  { 'hrsh7th/nvim-cmp' },
  { 'hrsh7th/cmp-buffer' },
  { 'hrsh7th/cmp-path' },
  { 'hrsh7th/cmp-nvim-lua' },
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'saadparwaiz1/cmp_luasnip' },
  { 'onsails/lspkind.nvim' },
  { 'williamboman/nvim-lsp-installer', requires = { { 'neovim/nvim-lspconfig' } } },

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
  { 'nvim-telescope/telescope.nvim', requires = { {'nvim-lua/plenary.nvim'}, {'folke/todo-comments.nvim'} } },

  -- Treesitter
  { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' },

  -- Git Blame
  { 'f-person/git-blame.nvim' },

  -- Harpoon
  { 'ThePrimeagen/harpoon', requires = { 'nvim-lua/plenary.nvim' } },

  -- Autoclose pairs
  { 'jiangmiao/auto-pairs' },

  -- autorun :noh when cursor moves
  { 'romainl/vim-cool' },

  -- Autorename and autoclose tags using treesitter
  { 'windwp/nvim-ts-autotag' },

  -- React plugins
  { 'styled-components/vim-styled-components' },

  -- Smooth scroll with ctrl+d/u
  { 'psliwka/vim-smoothie' }
}

return M
