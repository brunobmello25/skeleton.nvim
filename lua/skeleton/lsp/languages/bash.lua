local M = {}
local lspconfig = require('lspconfig')
local general = require('skeleton.lsp.languages.general')

function M.setup()
  lspconfig.bashls.setup {
    on_attach = function()
      general.set_keymaps()
      general.set_formatting_autocmd()
    end,
    capabilities = require('skeleton.lsp.languages.general').capabilities,
  }
end

return M
