return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require('catppuccin').setup({
        transparent_background = true,
        integrations = {
          telescope = true,
          leap = true,
          harpoon = true,
          mason = true,
          cmp = true,
          treesitter = true,
          gitsigns = true,
          dap = {
            enabled = true,
            enable_ui = true,
          }
        }
      })

      vim.cmd('colorscheme catppuccin-mocha')
    end
  },
}
