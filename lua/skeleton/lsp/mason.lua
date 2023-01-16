local M = {}

function M.setup()
    require('mason').setup()
    require('mason-lspconfig').setup()
end

return M
