require('skeleton.commands.splits')
require('skeleton.commands.cargowatch')
require('skeleton.commands.uuid')

vim.api.nvim_create_user_command("CurrentBufferNumber", function()
  print(vim.api.nvim_get_current_buf())
end, {
})
