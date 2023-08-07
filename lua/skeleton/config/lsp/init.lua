local M = {}

function M.config()
  vim.opt.signcolumn = 'yes'

  local lsp = require('lsp-zero').preset({})

  lsp.on_attach(function(client, bufnr)
    require('skeleton.config.lsp.keymaps').setup(client, bufnr)
    require('skeleton.config.lsp.autoformat').setup(client, bufnr)
  end)

  lsp.skip_server_setup({ 'rust_analyzer' })

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
      'pylsp',
    }
  })

  local rust_tools = require('rust-tools')

  local codelldb_path = vim.fn.exepath('codelldb')
  local liblldb_path = require("mason-registry").get_package("codelldb"):get_install_path() ..
      '/extension/lldb/lib/liblldb.so'

  rust_tools.setup({
    dap = {
      adapter = require('rust-tools.dap').get_codelldb_adapter(codelldb_path, liblldb_path)
    },
    server = {
      on_attach = function(client, bufnr)
        require('skeleton.config.lsp.keymaps').setup(client, bufnr)

        -- Hover actions
        vim.keymap.set("n", "<leader><leader>.", rust_tools.hover_actions.hover_actions, { buffer = bufnr })
        -- Code action groups
        vim.keymap.set("n", "<Leader>.", rust_tools.code_action_group.code_action_group, { buffer = bufnr })
      end
    }
  })
end

return M
