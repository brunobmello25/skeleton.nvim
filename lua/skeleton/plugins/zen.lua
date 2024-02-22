return {
  {
    "folke/zen-mode.nvim",
    config = function()
      vim.keymap.set("n", "<leader>o", function()
        require("zen-mode").toggle({
          window = {
            width = 1,
          },
        })
      end, { desc = "Toggle zen mode" })
    end,
  },
}
