local M = {}

function M.setup()
  local lspconfig = require('lspconfig')
  local general = require('skeleton.lsp.languages.general')

  lspconfig.sumneko_lua.setup {
    on_attach = function()
      general.set_keymaps()
      general.set_formatting_autocmd()
    end,
    capabilities = require('skeleton.lsp.languages.general').capabilities,
    settings = {
      Lua = {
        diagnostics = {
          globals = { 'vim' },
        },
      }
    }
  }
end

return M
