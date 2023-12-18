return {
  {
    "ThePrimeagen/harpoon",
    dependencies = { "nvim-lua/plenary.nvim" },
    branch = "harpoon2",
    config = function()
      local harpoon = require("harpoon")

      harpoon:setup({
        default = {
          sync_on_ui_close = true,
          save_on_toggle = true,
        },
      })

      vim.keymap.set("n", "<leader>ha", function()
        harpoon:list():append()
      end)

      vim.keymap.set("n", "<leader>hh", function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end)

      local function set_navigation(number)
        vim.keymap.set("n", "<leader>" .. number, function()
          harpoon:list():select(number)
        end, { desc = "Go to harpoon " .. number })
      end

      set_navigation(1)
      set_navigation(2)
      set_navigation(3)
      set_navigation(4)
      set_navigation(5)
      set_navigation(6)
      set_navigation(7)
      set_navigation(8)
      set_navigation(9)
    end,
  },
}
