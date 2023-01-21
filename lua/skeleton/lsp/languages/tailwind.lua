local M = {}

function M.setup()
  local lspconfig = require('lspconfig')

  lspconfig.tailwindcss.setup {
  }
end

return M
