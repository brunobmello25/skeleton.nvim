return {
  config = function()
    require('catppuccin').setup({
      integrations = {
        telescope = true
      }
    })

    vim.cmd('colorscheme catppuccin-mocha')
  end
}
