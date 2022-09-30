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

  -- move lines up and down
  vim.api.nvim_set_keymap('n', '<A-j>', ':m+<CR>==', {
    noremap = true
  })
  vim.api.nvim_set_keymap('n', '<A-k>', ':m-2<CR>==', {
    noremap = true
  })
  vim.api.nvim_set_keymap('v', '<A-j>', ':m+<CR>gv=gv', {
    noremap = true
  })
  vim.api.nvim_set_keymap('v', '<A-k>', ':m-2<CR>gv=gv', {
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

  -- open explorer
  vim.api.nvim_set_keymap('n', '<leader>e', ':Ex <CR>', {
    noremap = true
  })

  -- navigate between panes
  vim.keymap.set('n', '<C-h>', '<C-w>h')
  vim.keymap.set('n', '<C-j>', '<C-w>j')
  vim.keymap.set('n', '<C-k>', '<C-w>k')
  vim.keymap.set('n', '<C-l>', '<C-w>l')

  vim.keymap.set('n', '<leader>q', '<cmd>q<CR>')
end

return M
