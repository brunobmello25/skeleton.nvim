local M = {}

function M.setup()
  vim.opt.foldenable = false
  vim.opt.foldlevel = 99
  vim.opt.fillchars = "fold: "
  vim.opt.foldmethod = "indent"
end

return M
