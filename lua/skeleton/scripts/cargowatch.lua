vim.api.nvim_create_user_command('CargoWatch', function()
  vim.ui.input({
    prompt = 'Enter a cargo watch command (defaults to run): ',
  }, function(command)
    if command == '' then
      command = 'run'
    end

    local current_window = vim.api.nvim_get_current_win()

    vim.cmd('vnew')

    vim.cmd('terminal')

    -- vim.api.nvim_win_set_cursor(0, { 1, 0 })

    vim.cmd('startinsert')

    -- vim.fn.termopen('cargo watch -x ' .. command)
    --
    -- vim.api.nvim_set_current_win(current_window)
  end)
end, {})
