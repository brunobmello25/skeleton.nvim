local M = {}

function M.setup()
    require('catppuccin').setup({
        transparent_background = true
    })

    vim.cmd [[colorscheme catppuccin]]
end

return M
