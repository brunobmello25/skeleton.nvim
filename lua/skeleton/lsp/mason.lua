local M = {}

function M.setup()
  require('mason').setup()
  require('mason-lspconfig').setup({
    ensure_installed = {
      'jsonls',
      'tailwindcss',
      'sumneko_lua',
      'eslint',
      'gopls',
      'bashls',
      'prismals',
      'jedi_language_server'
    },
  })
end

return M
