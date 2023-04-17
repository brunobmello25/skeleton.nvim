local M = {}

function M.config()
  vim.keymap.set('n', '<leader>zm', ':ZenMode<CR>', { noremap = true, silent = true })
end

return M
