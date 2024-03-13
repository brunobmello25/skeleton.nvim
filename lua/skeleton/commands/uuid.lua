vim.api.nvim_create_user_command('UUID', function()
  local output = vim.fn.system("uuidgen")

  vim.fn.setreg('"', vim.trim(output))
end, { desc = "Generate a new uuid" })
