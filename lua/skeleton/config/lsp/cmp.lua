local M = {}

function M.setup()
  local cmp = require("cmp")
  local cmp_format = require("lsp-zero").cmp_format()
  local luasnip = require("luasnip")

  local cmp_select = { behavior = cmp.SelectBehavior.Select }

  local function has_words_before()
    unpack = unpack or table.unpack
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
  end

  require("luasnip.loaders.from_vscode").lazy_load()

  cmp.setup({
    formatting = cmp_format,
    sources = {
      { name = "nvim_lsp", keyword_length = 3 },
      { name = "buffer", keyword_length = 3 },
      { name = "luasnip", keyword_length = 2 },
    },
    mapping = {
      ["<C-e>"] = cmp.mapping.abort(),

      ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),

      ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),

      ["<CR>"] = cmp.mapping.confirm({ select = true }),

      ["<C-u>"] = vim.NIL,

      ["<C-Space>"] = cmp.mapping.complete(),

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
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { "i", "s" }),
    },
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end,
    },
  })
end

return M
