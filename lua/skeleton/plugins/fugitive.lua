return {
  {
    'tpope/vim-fugitive',
    config = function()
      vim.keymap.set('n', '<leader>gcs', "<cmd>Gvdiffsplit!<CR>", { desc = "Open fugitive conflict resolution" })
    end
  },
}
