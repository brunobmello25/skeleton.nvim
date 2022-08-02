local M = {}

function M.setup()
  vim.g.catppuccin_flavour = "mocha"

  require('catppuccin').setup({
    transparent_background = true,
    integrations = {
      telescope = true
    }
  })

  vim.cmd [[colorscheme catppuccin]]
end

return M
