return {
  config = function()
    vim.keymap.set('n', '<leader>ff', "<cmd>lua require('telescope.builtin').find_files({ hidden = true })<CR>",
      { desc = "Find files" })
    vim.keymap.set('n', "<leader>fg", '<cmd>Telescope live_grep<cr>', { desc = 'Live grep' })
    vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<cr>', { desc = 'Buffers' })
    vim.keymap.set('n', '<leader>fd', '<cmd>Telescope diagnostics<cr>', { desc = 'diagnostics' })
    vim.keymap.set('n', '<leader>fq', '<cmd>Telescope quickfix<cr>', { desc = 'List items in the quickfix list' })
    vim.keymap.set('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', { desc = 'List help tags' })
  end
}
