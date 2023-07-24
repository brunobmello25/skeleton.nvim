local M = {}

function M.config()
  vim.opt.signcolumn = 'yes'

  local lsp = require('lsp-zero').preset({})

  lsp.on_attach(function(client, bufnr)
    require('skeleton.config.lsp.keymaps').setup(client, bufnr)
    require('skeleton.config.lsp.autoformat').setup(client, bufnr)
  end)

  lsp.skip_server_setup({ 'rust_analyzer' })

  -- (Optional) Configure lua language server for neovim
  -- TODO: delete this if neodev works fine
  -- require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

  lsp.setup()

  require('skeleton.config.lsp.cmp').setup()

  require('mason-lspconfig').setup({
    ensure_installed = {
      'eslint',
      'lua_ls',
      'vtsls',
      'jsonls',
      'bashls',
      'tailwindcss',
    }
  })

  local rust_tools = require('rust-tools')

  rust_tools.setup({
    server = {
      on_attach = function(client, bufnr)
        require('skeleton.config.lsp.keymaps').setup(client, bufnr)

        -- Hover actions
        vim.keymap.set("n", "<F5>", rust_tools.hover_actions.hover_actions, { buffer = bufnr })
        -- Code action groups
        vim.keymap.set("n", "<Leader>.", rust_tools.code_action_group.code_action_group, { buffer = bufnr })
      end
    }
  })
end

return M
