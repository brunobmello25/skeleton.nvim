local function create_split()
  local width = vim.api.nvim_get_option('columns')

  vim.cmd('vnew')

  vim.cmd('vertical resize ' .. math.floor(width * 0.4))

  vim.cmd('term')
end

vim.api.nvim_create_user_command('Terminal', create_split, {})
