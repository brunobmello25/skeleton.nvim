local M = {}

function M.setup()
  local lspconfig = require('lspconfig')
  local general = require('skeleton.lsp.languages.general')

  lspconfig.gopls.setup {
    on_attach = function()
      general.set_keymaps()
      vim.cmd([[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]])
    end,
    capabilities = require('skeleton.lsp.languages.general').capabilities,
  }
end

return M
