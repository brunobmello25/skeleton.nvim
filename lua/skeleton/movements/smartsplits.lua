local M = {}


function M.setup()
    local smartsplits = require('smart-splits')

    smartsplits.setup({})

    -- resizing splits
    vim.keymap.set('n', '<A-h>', smartsplits.resize_left)
    vim.keymap.set('n', '<A-j>', smartsplits.resize_down)
    vim.keymap.set('n', '<A-k>', smartsplits.resize_up)
    vim.keymap.set('n', '<A-l>', smartsplits.resize_right)

    -- moving between splits
    vim.keymap.set('n', '<C-h>', smartsplits.move_cursor_left)
    vim.keymap.set('n', '<C-j>', smartsplits.move_cursor_down)
    vim.keymap.set('n', '<C-k>', smartsplits.move_cursor_up)
    vim.keymap.set('n', '<C-l>', smartsplits.move_cursor_right)
end

return M
