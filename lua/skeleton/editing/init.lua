local M = {}

function M.setup()
  require("nvim-autopairs").setup {}

  require('nvim_comment').setup({
    operator_mapping = "<leader>/",
    hook = function()
      local filetype = vim.api.nvim_buf_get_option(0, "filetype")

      if filetype == "typescriptreact" or filetype == "javascriptreact" then
        require("ts_context_commentstring.internal").update_commentstring({
          key = '__multiline'
        })
      end
    end
  })

  -- copilot
  vim.g.copilot_no_tab_map = true
  vim.api.nvim_set_keymap("i", "<C-u>", 'copilot#Accept("<CR>")', {
    silent = true,
    expr = true
  })

  require('neoclip').setup({
    keys = {
      telescope = {
        i = {
          select = '<cr>',
          paste = false,
          paste_behind = false,
          replay = false, -- replay a macro
          delete = '<c-d>', -- delete an entry
          custom = {},
        },
        n = {
          select = '<cr>',
          paste = false,
          --- It is possible to map to more than one key.
          -- paste = { 'p', '<c-p>' },
          paste_behind = false,
          replay = false,
          delete = 'd',
          custom = {},
        },
      }
    }
  })
  vim.api.nvim_set_keymap('n', '<leader>fy', ":lua require('telescope').extensions.neoclip.neoclip()<CR>",
    { noremap = true })
end

return M
