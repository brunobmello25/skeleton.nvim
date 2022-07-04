local M = {}

function M.setup()
  local lspconfig = require('lspconfig')
  local basics = require('skeleton.lsp.keymaps')

  lspconfig.tsserver.setup {
    on_attach = function()
      basics.keymaps()
    end,
    capabilities = require('skeleton.lsp.completion').get_capabilities(),
  }

  lspconfig.eslint.setup {
    on_attach = function(client)
      basics.keymaps()

      client.resolved_capabilities.document_formatting = true

      local autogroup_eslint_lsp = vim.api.nvim_create_augroup("eslint_lsp", { clear = true })

      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*",
        command = "EslintFixAll",
        group = autogroup_eslint_lsp,
      })
    end,
    capabilities = require('skeleton.lsp.completion').get_capabilities(),
  }
end

return M

