local M = {}

function M.setup()
  vim.keymap.set({ 'n', 'v' }, '<leader>y', '"+y<CR>')

  -- indent lines with tab and shift+tab in visual mode
  vim.keymap.set('v', '<Tab>', '>gv')
  vim.keymap.set('v', '<S-Tab>', '<gv')

  -- copy relative path
  vim.cmd('command! CopyRelPath call setreg(\'+\', expand(\'%\'))')

  vim.keymap.set('n', '<leader>q', '<cmd>q<CR>')

  -- move selected lines up and down with J and K
  vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
  vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")
end

return M