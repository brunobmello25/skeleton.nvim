local M = {}

function M.setup()
  vim.api.nvim_set_keymap('n', '<leader>ff', "<cmd>lua require('telescope.builtin').find_files({ hidden = true })<CR>",
    { noremap = true })
  vim.api.nvim_set_keymap('n', '<leader>fg', "<cmd>lua require('telescope.builtin').live_grep()<CR>", { noremap = true })
  vim.api.nvim_set_keymap('n', '<leader>fb', "<cmd>lua require('telescope.builtin').buffers()<CR>", { noremap = true })
  vim.api.nvim_set_keymap('n', '<leader>ft', ':TodoTelescope<CR>', { noremap = true })
  vim.api.nvim_set_keymap('n', '<leader>fd', ':Telescope diagnostics<CR>', { noremap = true })
  vim.api.nvim_set_keymap('n', '<leader>fr', ':Telescope resume<CR>', { noremap = true })
end

return M
