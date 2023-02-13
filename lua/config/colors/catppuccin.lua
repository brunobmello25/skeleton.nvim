local M = {}

function M.config()
  require('catppuccin').setup({
    integrations = {
      telescope = true,
      leap = true,
      harpoon = true,
      mason = true,
      cmp = true,
      treesitter = true
    }
  })

  vim.cmd('colorscheme catppuccin-mocha')
end

return M
