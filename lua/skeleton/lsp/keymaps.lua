local M = {}

function M.keymaps()
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = 0 })
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = 0 })
  vim.keymap.set('n', 'gT', vim.lsp.buf.type_definition, { buffer = 0 })
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, { buffer = 0 })
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { buffer = 0 })
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { buffer = 0 })
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { buffer = 0 })
  vim.keymap.set('n', '<leader>dl', '<cmd>Telescope diagnostics<CR>', { buffer = 0 })
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { buffer = 0 })
  vim.keymap.set('n', '<leader>.', vim.lsp.buf.code_action, { buffer = 0 })
  vim.keymap.set('n', '<leader>q', '<cmd>q<CR>')
  vim.keymap.set('n', '<leader>H', '<C-w>h')
  vim.keymap.set('n', '<leader>J', '<C-w>j')
  vim.keymap.set('n', '<leader>K', '<C-w>k')
  vim.keymap.set('n', '<leader>L', '<C-w>l')
end

return M