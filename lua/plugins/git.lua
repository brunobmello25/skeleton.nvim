return {
  {
    'f-person/git-blame.nvim',
    init = function()
      vim.g.gitblame_ignored_filetypes = { 'netrw' }
    end
  },

  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  }
}
