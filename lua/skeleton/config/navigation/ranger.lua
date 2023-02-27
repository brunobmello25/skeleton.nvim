local M = {}

function M.init()
  -- vim.g.rnvimr_enable_ex = 1 -- TODO: decide if I wanna use this
  vim.g.rnvimr_enable_picker = 1
end

function M.config()
  vim.keymap.set('n', '<leader>e', '<cmd>RnvimrToggle<cr>')
end

return M
