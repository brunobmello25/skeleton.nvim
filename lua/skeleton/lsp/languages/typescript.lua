local M = {}

function M.setup()
  local lspconfig = require('lspconfig')
  local general = require('skeleton.lsp.languages.general')

  require('lspconfig.configs').vtsls = require('vtsls').lspconfig

  lspconfig.vtsls.setup({
    on_attach = function()
      general.set_keymaps()

      vim.keymap.set('n', '<leader>p', '<cmd>Neoformat prettier<cr>', { buffer = 0 })
    end,

    capabilities = require('skeleton.lsp.languages.general').capabilities,

    flags = {
      allow_incremental_sync = true,
    },
  })

  lspconfig.eslint.setup {
    on_attach = function()
      -- client.server_capabilities.document_formatting = true

      local eslint_autogroup = vim.api.nvim_create_augroup("eslint_lsp", { clear = true })

      vim.api.nvim_create_autocmd("BufWritePre", {
        command = "EslintFixAll",
        group = eslint_autogroup,
        buffer = 0,
      })
    end,
    capabilities = require('skeleton.lsp.languages.general').capabilities,
  }
end

function EslintConfigExists()
  local root_dir = vim.fn.expand('%:p:h')

  local eslint_config_files = {
    'eslintrc.js',
    'eslintrc.json',
  }

  for _, file in ipairs(eslint_config_files) do
    if vim.fn.exists(root_dir .. '/' .. file) then
      return true
    end
  end

  return false
end

return M
