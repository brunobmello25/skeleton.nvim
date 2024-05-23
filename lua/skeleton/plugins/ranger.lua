return {
  {
    "francoiscabrol/ranger.vim",
    dependencies = {
      "rbgrouleff/bclose.vim",
    },
    init = function()
      vim.g.ranger_map_keys = 0
    end,
    config = function()
      if vim.fn.has('win32') == 1 or vim.fn.has('win64') == 1 then
        vim.keymap.set("n", "<leader>e", "<cmd>Ex<cr>", { desc = "Open netrw" })
      else
        vim.keymap.set("n", "<leader>e", "<cmd>Ranger<cr>", { desc = "Open ranger" })
      end
    end,
  },
}

