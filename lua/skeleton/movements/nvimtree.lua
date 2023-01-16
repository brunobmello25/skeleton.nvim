local M = {}

function M.setup()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    vim.opt.termguicolors = true

    require('nvim-tree').setup({
        respect_buf_cwd = true,
        view = {
            adaptive_size = true,
        }
    })

    vim.keymap.set('n', '<leader>e', ':NvimTreeFindFileToggle<CR>', {
        noremap = true
    })
end

return M
