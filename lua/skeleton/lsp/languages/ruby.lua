local M = {}

function M.setup()
  local lspconfig = require('lspconfig')
  local general = require('skeleton.lsp.languages.general')

  lspconfig.solargraph.setup {
    on_attach = function()
      general.set_keymaps()
    end,
    capabilities = require('skeleton.lsp.languages.general').capabilities,
  }
end

return M
