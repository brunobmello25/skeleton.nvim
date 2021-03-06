local M = {}

function M.setup()
  local lspconfig = require('lspconfig')
  local basics = require('skeleton.lsp.keymaps')

  lspconfig.gopls.setup {
    on_attach = function()
      basics.keymaps()
      vim.cmd([[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()]])
    end,
    capabilities = require('skeleton.lsp.completion').get_capabilities(),
  }
end

return M

