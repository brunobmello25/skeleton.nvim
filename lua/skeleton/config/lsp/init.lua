local M = {}

function M.config()
  vim.opt.signcolumn = 'yes'

  -- Learn the keybindings, see :help lsp-zero-keybindings
  -- Learn to configure LSP servers, see :help lsp-zero-api-showcase
  local lsp = require('lsp-zero')
  lsp.preset('recommended')

  lsp.set_preferences({
    set_lsp_keymaps = false
  })

  lsp.ensure_installed({
    'eslint',
    'lua_ls',
    'vtsls',
    'jsonls',
    'bashls',
    'tailwindcss',
    'rust_analyzer',
  })

  require('skeleton.config.lsp.cmp').setup()

  lsp.on_attach(function(client, bufnr)
    require('skeleton.config.lsp.keymaps').setup(client, bufnr)
    require('skeleton.config.lsp.autoformat').setup(client, bufnr)
  end)

  -- Configure lua language server for neovim
  lsp.nvim_workspace()

  lsp.skip_server_setup({ 'rust_analyzer' })

  lsp.setup()
end

return M
