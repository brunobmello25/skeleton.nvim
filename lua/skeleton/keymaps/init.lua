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

  vim.keymap.set('n', '<leader>w', '<C-w>')
end

return M
