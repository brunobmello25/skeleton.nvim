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
      'vtsls'
    })

    local cmp = require('cmp')
    local cmp_select = { behavior = cmp.SelectBehavior.Select }
    local cmp_mappings = lsp.defaults.cmp_mappings({
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.close(),
      ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
      ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    })

    lsp.setup_nvim_cmp({
      mapping = cmp_mappings
    })

    lsp.on_attach(function(client, bufnr)
      local opts = { buffer = bufnr, remap = false }

      vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
      vim.keymap.set('n', 'gT', vim.lsp.buf.type_definition, opts)
      vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
      vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
      vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
      vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
      -- go to error only
      vim.keymap.set('n', '[e', function() vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR }) end,
        opts)
      vim.keymap.set('n', ']e', function() vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR }) end,
        opts)
      vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
      vim.keymap.set('n', '<leader>.', vim.lsp.buf.code_action, opts)

      local name = client.name
      local skip_format_autocmd = name == 'eslint' or name == 'vtsls' or name == 'tsserver'

      if not skip_format_autocmd then
        local group = vim.api.nvim_create_augroup("LspFormatOnSave", { clear = true })

        vim.api.nvim_create_autocmd("BufWritePre", { command = "LspZeroFormat", group = group })
      end

      if name == 'eslint' then
        local group = vim.api.nvim_create_augroup('EslintFormatOnSave', { clear = true })

        vim.api.nvim_create_autocmd('BufWritePre', { command = 'EslintFixAll', group = group })
      end
    end)

    -- Configure lua language server for neovim
    lsp.nvim_workspace()

    lsp.setup()
  end
}
