local lsp = require('lsp-zero')
local cmp = require('cmp')
local luasnip = require('luasnip')

local function has_words_before()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local function get_cmp_mappings()
  local cmp_select = { behavior = cmp.SelectBehavior.Select }

  return lsp.defaults.cmp_mappings({
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<C-u>'] = vim.NIL,
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
        -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
        -- they way you will only jump inside the snippet region
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable( -1) then
        luasnip.jump( -1)
      else
        fallback()
      end
    end, { "i", "s" }),
  })
end

local function get_cmp_sources()
  return {
    { name = 'nvim_lsp', keyword_length = 3 },
    { name = 'buffer',   keyword_length = 3 },
    { name = 'luasnip',  keyword_length = 2 },
  }
end

local M = {}

function M.setup()
  lsp.setup_nvim_cmp({
    mapping = get_cmp_mappings(),
    sources = get_cmp_sources(),
  })
end

return M
