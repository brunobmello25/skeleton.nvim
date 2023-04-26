local M = {}

local function create_split()
  local command = vim.fn.input('Cargo watch command: ')

  vim.cmd('silent !tmux split-window -hf "cargo watch -x ' .. command .. '"')
end

M.setup = function()
  vim.api.nvim_create_user_command('CargoWatch', create_split, {})
end

return M
