local M = {}

function M.setup()
  vim.g.gitblame_ignored_filetypes = {'netrw'}
end

return M