local M = {}

function M.setup()
    require('catppuccin').setup({
        transparent_background = true,
        integrations = {
          telescope = false
        }
    })

    vim.cmd [[colorscheme catppuccin]]
end

return M
