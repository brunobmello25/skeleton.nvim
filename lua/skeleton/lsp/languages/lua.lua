local M = {}

function M.setup()
  local lspconfig = require('lspconfig')
  local basics = require('skeleton.lsp.languages.basics')

  lspconfig.sumneko_lua.setup {
    on_attach = function()
      basics.keymaps()
    end,
    capabilities = require('skeleton.lsp.completion').get_capabilities(),
  }
end

return M

