return {
  {
    'tpope/vim-fugitive',
    config = function()
      vim.keymap.set("n", "gf", "<cmd>diffget //2<CR>", { desc = "Get left side of diff" })
      vim.keymap.set("n", "gj", "<cmd>diffget //3<CR>", { desc = "Get left side of diff" })
    end
  },
}
