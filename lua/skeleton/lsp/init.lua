local M = {}

function M.setup()
  require('skeleton.lsp.installer').setup()

  require('skeleton.lsp.languages.golang').setup()
end

return M
