local M = {}

function M.setup()
  local cmp = require("cmp")
  local cmp_format = require("lsp-zero").cmp_format()
  local luasnip = require("luasnip")

  local cmp_select = { behavior = cmp.SelectBehavior.Select }

  local function has_words_before()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
  end

  cmp.setup({
    formatting = cmp_format,
    souces = {
      { name = "nvim_lsp", keyword_length = 3 },
      { name = "buffer", keyword_length = 3 },
      { name = "luasnip", keyword_length = 2 },
    },
    mapping = {
      ["<C-Space>"] = cmp.mapping.complete(),
      ["<C-e>"] = cmp.mapping.close(),
      ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
      ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
      ["<CR>"] = cmp.mapping.confirm({ select = true }),
      ["<C-u>"] = vim.NIL,
    },
  })
end

return M
