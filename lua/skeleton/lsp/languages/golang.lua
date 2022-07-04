local M = {}

function M.setup()
  local lspconfig = require('lspconfig')
  local basics = require('skeleton.lsp.languages.basics')

  lspconfig.gopls.setup {
    on_attach = function()
      basics.keymaps()
    end,
  }
end

return M

