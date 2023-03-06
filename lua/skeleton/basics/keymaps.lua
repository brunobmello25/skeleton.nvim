return {
  setup = function()
    vim.keymap.set({ 'n', 'v' }, '<leader>y', '"+y<CR>')

    -- indent lines with tab and shift+tab in visual mode
    vim.keymap.set('v', '>', '>gv')
    vim.keymap.set('v', '<', '<gv')

    -- copy relative path
    vim.cmd("command! CopyRelPath call setreg('+', expand('%'))")

    vim.keymap.set('n', '<leader>q', '<cmd>q<CR>')

    -- move selected lines up and down with J and K
    vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
    vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

    vim.keymap.set('n', 'J', 'mzJ`z')

    vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

    vim.keymap.set('c', '<C-h>', '<Left>')
    vim.keymap.set('c', '<C-l>', '<Right>')

    -- exit terminal with esc in terminal mode
    vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')

    -- prevent yank when pasting from visual mode
    vim.keymap.set('x', 'p', '"_dP')

    -- send ctrl+f to terminal
    vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
  end
}
