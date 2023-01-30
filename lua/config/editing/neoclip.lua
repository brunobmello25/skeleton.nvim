return {
  config = function()
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

    vim.keymap.set('n', '<leader>fy', "<cmd>lua require('telescope').extensions.neoclip.neoclip()<cr>")
  end
}
