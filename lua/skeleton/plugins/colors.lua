return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require('catppuccin').setup({
        transparent_background = true,
        color_overrides = {
          mocha = {
            base = "#000000",
            mantle = "#000000",
            crust = "#000000",
          },
        },
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
  }
}
