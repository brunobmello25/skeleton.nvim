local M = {}


function M.init()
  vim.g.gitblame_ignored_filetypes = { 'netrw' }
end

return M
