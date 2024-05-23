local M = {}

function M.config()
  vim.opt.signcolumn = "yes"

  local lsp = require("lsp-zero").preset({})

  local function on_attach(client, bufnr)
    require("skeleton.config.lsp.keymaps").setup(client, bufnr)

    if client.name == "eslint" then
      vim.cmd("augroup MyEslintAutoCmdGroup")
      vim.cmd("autocmd!") -- Clear any autocmds in the group to avoid multiple registrations
      vim.cmd(string.format("autocmd BufWritePre <buffer=%s> EslintFixAll", bufnr))
      vim.cmd("augroup END")
    end
  end

  lsp.on_attach(function(client, bufnr)
    on_attach(client, bufnr)
  end)

  lsp.setup()

  require("skeleton.config.lsp.cmp").setup()

  require("mason").setup()
  require("mason-lspconfig").setup({
    ensure_installed = {
      "eslint",
      "lua_ls",
      "gopls",
      "tsserver",
      "jsonls",
      "bashls",
      "tailwindcss",
      "rust_analyzer",
      "pyright"
    },
    handlers = {
      lsp.default_setup,
      lua_ls = function()
        local lua_opts = lsp.nvim_lua_ls()
        require("lspconfig").lua_ls.setup(lua_opts)
      end,
      rust_analyzer = lsp.noop,
      jdtls = lsp.noop,
    },
  })

  local rust_tools = require("rust-tools")

  local codelldb_path = vim.fn.exepath("codelldb")
  local liblldb_path = require("mason-registry").get_package("codelldb"):get_install_path()
    .. "/extension/lldb/lib/liblldb.so"

  rust_tools.setup({
    dap = {
      adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
    },
    server = {
      on_attach = function(client, bufnr)
        require("skeleton.config.lsp.keymaps").setup(client, bufnr)

        -- Hover actions
        vim.keymap.set("n", "<leader><leader>.", rust_tools.hover_actions.hover_actions,
          { buffer = bufnr, desc = "Rust tools hover actions" })
        -- Code action groups
        vim.keymap.set("n", "<Leader>.", rust_tools.code_action_group.code_action_group,
          { buffer = bufnr, desc = "Rust tools code action group" })
      end,
    },
  })

  require('lspconfig').gdscript.setup({
    on_attach = function(client, bufnr)
      require("skeleton.config.lsp.keymaps").setup(client, bufnr)
    end,
    -- capabilities = lsp.capabilities,
    cmd = { "ncat", "localhost", os.getenv('GDScript_Port') or 6005 },
  })
end

return M
