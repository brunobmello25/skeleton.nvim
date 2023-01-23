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

  -- indent lines with tab and shift+tab in visual mode
  vim.api.nvim_set_keymap('v', '<Tab>', '>gv', {
    noremap = true
  })
  vim.api.nvim_set_keymap('v', '<S-Tab>', '<gv', {
    noremap = true
  })

  -- copy relative path
  vim.cmd('command! CopyRelPath call setreg(\'+\', expand(\'%\'))')

  vim.keymap.set('n', '<leader>q', '<cmd>q<CR>')

  -- move selected lines up and down with J and K
  vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
  vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

  vim.opt.tabstop = 2
  vim.opt.mouse = 'a'
  vim.opt.expandtab = true
  vim.opt.number = true
  vim.opt.relativenumber = true
  vim.opt.shiftwidth = 2
  vim.opt.scrolloff = 8
  vim.opt.wrap = false
  vim.opt.ignorecase = true
  vim.cmd('filetype plugin indent on')
  vim.cmd('set splitbelow splitright')
  vim.opt.incsearch = true

  -- code folding
  vim.opt.foldenable = false
  vim.opt.foldlevel = 99
  vim.opt.fillchars = "fold: "
  vim.opt.foldmethod = "indent"
end

return M
