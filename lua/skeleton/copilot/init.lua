local M = {}

function M.setup()
  vim.g.copilot_no_tab_map = true
  vim.api.nvim_set_keymap("i", "<C-m>", 'copilot#Accept("<CR>")', {
    silent = true,
    expr = true
  })
end

return M
