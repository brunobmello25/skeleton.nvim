return {
  setup = function()
    local lsp = require('lsp-zero')

    local cmp = require('cmp')
    local cmp_select = { behavior = cmp.SelectBehavior.Select }
    local cmp_mappings = lsp.defaults.cmp_mappings({
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<C-u>'] = vim.NIL
      })
    local cmp_sources = {
      { name = 'nvim_lsp', keyword_length = 3 },
      { name = 'buffer',   keyword_length = 3 },
      { name = 'luasnip',  keyword_length = 2 },
    }

    lsp.setup_nvim_cmp({
      mapping = cmp_mappings,
      sources = cmp_sources,
    })
  end
}
