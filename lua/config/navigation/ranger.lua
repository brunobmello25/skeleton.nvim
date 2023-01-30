return {
  init = function()
    vim.g.ranger_map_keys = 0
  end,

  config = function()
    vim.keymap.set('n', '<leader>e', '<cmd>Ranger<cr>')
  end,
}
