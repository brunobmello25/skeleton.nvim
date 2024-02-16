return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "kyazdani42/nvim-web-devicons", lazy = true },
    config = function()
      require("lualine").setup({
        sections = {
          lualine_c = {
            { "filename", path = 1 },
            {
              function()
                return " "
                -- return require("dap").status()
              end,
              icon = { "", color = { fg = "#e7c664" } }, -- nerd icon.
              cond = function()
                if not package.loaded.dap then
                  return false
                end
                local session = require("dap").session()
                return session ~= nil
              end,
            },
          },
        },
        options = {
          theme = "catppuccin",
          icons_enabled = true,
          globalstatus = true,
          disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
          always_divide_middle = true,
        },
      })
    end,
  },
}
