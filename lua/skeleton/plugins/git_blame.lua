return {
  {
    'f-person/git-blame.nvim',
    init = function()
      vim.g.gitblame_ignored_filetypes = { 'netrw' }
      vim.g.gitblame_enabled = 0
    end,
  },
}
