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

  { 'f-person/git-blame.nvim' }
}

return M
