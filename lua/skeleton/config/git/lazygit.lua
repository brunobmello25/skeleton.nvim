local M = {}

function M.config()
  vim.keymap.set('n', '<leader>lg', '<cmd>LazyGit<cr>')
end

return M
