return {
  -- {
  --   'kevinhwang91/rnvimr',
  --   init = function()
  --     vim.g.rnvimr_enable_picker = 1
  --   end,
  --   config = function()
  --     vim.keymap.set('n', '<leader>e', '<cmd>RnvimrToggle<cr>')
  --   end
  -- },
  {
    "francoiscabrol/ranger.vim",
    dependencies = {
      "rbgrouleff/bclose.vim",
    },
    init = function()
      vim.g.ranger_map_keys = 0
    end,
    config = function()
      vim.keymap.set("n", "<leader>e", "<cmd>Ranger<cr>")
    end,
  },
}
