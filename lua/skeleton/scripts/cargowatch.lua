local function create_split()
  local width = vim.api.nvim_get_option('columns')

  vim.cmd('vnew')

  vim.cmd('vertical resize ' .. math.floor(width * 0.4))

  vim.cmd('term')

  vim.cmd("call feedkeys('i')")

  local cmd = "cargo watch -x"

  vim.cmd("call feedkeys('" .. cmd .. "')")
end

vim.api.nvim_create_user_command('CargoWatch', create_split, {})
