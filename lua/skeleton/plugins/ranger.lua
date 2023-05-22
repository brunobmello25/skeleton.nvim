return {
  {
    'kevinhwang91/rnvimr',
    init = function()
      vim.g.rnvimr_enable_picker = 1
    end,
    config = function()
      vim.keymap.set('n', '<leader>e', '<cmd>RnvimrToggle<cr>')
    end
  },
}
