return {
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
