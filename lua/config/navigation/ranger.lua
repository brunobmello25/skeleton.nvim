local M = {}

function M.init()
  vim.g.ranger_map_keys = 0
end

function M.confg()
  vim.keymap.set('n', '<leader>e', '<cmd>Ranger<cr>')
end

return M
