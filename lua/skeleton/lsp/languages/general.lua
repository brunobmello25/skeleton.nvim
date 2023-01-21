local M = {}

M.capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

M.autoformat_group = vim.api.nvim_create_augroup('AutoformatGroup', { clear = true })

function M.set_keymaps()
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = 0 })
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = 0 })
  vim.keymap.set('n', 'gT', vim.lsp.buf.type_definition, { buffer = 0 })
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, { buffer = 0 })
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { buffer = 0 })
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { buffer = 0 })
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { buffer = 0 })
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { buffer = 0 })
  vim.keymap.set('n', '<leader>.', vim.lsp.buf.code_action, { buffer = 0 })
end

function M.set_formatting_autocmd()
  local autocmd = vim.api.nvim_create_autocmd("BufWritePre",
    {
      -- command = "lua vim.lsp.buf.format()",
      callback = function()
        vim.lsp.buf.format()
      end,
      group = M.autoformat_group,
      buffer = 0
    }
  )

  return autocmd
end

return M
