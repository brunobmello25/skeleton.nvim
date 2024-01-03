return {
  {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("oil").setup({
        keymaps = {
          ["."] = "actions.parent",
          ["q"] = "actions.close",
        },
      })

      vim.keymap.set("n", "<leader>e", function()
        local bufnr = require("oil").toggle_float()
        print(bufnr)
      end)
    end,
  },
}
