local function run_command(command)
  local is_in_tmux = vim.env.TMUX ~= nil

  if not is_in_tmux then
    vim.cmd(command)
    return
  end

  if command == 'vnew' then
    vim.cmd('silent !tmux split-window -hf')
  elseif command == 'new' then
    vim.cmd('silent !tmux split-window -vf')
  end
end

vim.api.nvim_create_user_command('Vnew', function() run_command('vnew') end, {})
vim.api.nvim_create_user_command('New', function() run_command('new') end, {})
