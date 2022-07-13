local M = {}

function M.setup()
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

    vim.keymap.set('n', '<leader>q', '<cmd>q<CR>')
    vim.keymap.set('n', '<leader>H', '<C-w>h')
    vim.keymap.set('n', '<leader>J', '<C-w>j')
    vim.keymap.set('n', '<leader>K', '<C-w>k')
    vim.keymap.set('n', '<leader>L', '<C-w>l')
end

return M
