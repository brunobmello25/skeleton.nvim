vim.api.nvim_create_user_command('CargoWatch', function()
  local command = vim.fn.input('Cargo watch command: ')

  vim.cmd('silent !tmux split-window -hf "cargo watch -x ' .. command .. '"')
end, {})
