local M = {}

function M.setup()
  vim.g.mapleader = ' '

  -- yank to clipboard
  vim.api.nvim_set_keymap('n', '<leader>y', '"+y<CR>', {
    noremap = true
  })
  vim.api.nvim_set_keymap('v', '<leader>y', '"+y<CR>', {
    noremap = true
  })

  -- indent lines with > and < in visual mode
  vim.api.nvim_set_keymap('v', '<Tab>', '>gv', {
    noremap = true
  })
  vim.api.nvim_set_keymap('v', '<S-Tab>', '<gv', {
    noremap = true
  })

  -- copy relative path
  vim.cmd('command! CopyRelPath call setreg(\'+\', expand(\'%\'))')

  vim.keymap.set('n', '<leader>q', '<cmd>q<CR>')

  vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
  vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")
end

return M
