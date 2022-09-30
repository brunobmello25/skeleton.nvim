local M = {}

function M.setup()
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
