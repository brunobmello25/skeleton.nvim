local M = {}

function M.setup()
  local lspconfig = require('lspconfig')
  local keymaps = require('skeleton.lsp.keymaps')

  lspconfig.sumneko_lua.setup {
    on_attach = function()
      keymaps.setup()
      vim.cmd([[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()]])
    end,
    capabilities = require('skeleton.lsp.completion').get_capabilities(),
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
