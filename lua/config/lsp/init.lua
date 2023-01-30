return {
  setup = function()
    vim.opt.signcolumn = 'yes'

    -- Learn the keybindings, see :help lsp-zero-keybindings
    -- Learn to configure LSP servers, see :help lsp-zero-api-showcase
    local lsp = require('lsp-zero')
    lsp.preset('recommended')

    lsp.ensure_installed({
      'eslint',
      'sumneko_lua',
      'tsserver'
    })

    require('config.lsp.cmp').setup()

    lsp.on_attach(function(client, bufnr)
      require('config.lsp.keymaps').setup(client, bufnr)
      require('config.lsp.autoformat').setup(client, bufnr)
    end)

    -- Configure lua language server for neovim
    lsp.nvim_workspace()

    lsp.setup()
  end
}
