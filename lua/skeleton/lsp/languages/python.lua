local M = {}

function M.setup()
  local lspconfig = require('lspconfig')
  local keymaps = require('skeleton.lsp.keymaps')

  lspconfig.jedi_language_server.setup {
    on_attach = function()
      keymaps.setup()
      vim.cmd([[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]])
    end,
    capabilities = require('skeleton.lsp.completion').get_capabilities(),
  }
end

return M
