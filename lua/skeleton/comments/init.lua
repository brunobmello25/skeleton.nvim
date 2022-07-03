local M = {}

function M.setup()
  require('nvim_comment').setup({
    operator_mapping = "<leader>/"
  })  
end

return M
