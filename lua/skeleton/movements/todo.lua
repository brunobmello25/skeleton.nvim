local M = {}

function M.setup()
    require("todo-comments").setup {}

    vim.api.nvim_set_keymap('n', '<leader>ft', ':TodoTelescope<CR>', { noremap = true })
end

return M
