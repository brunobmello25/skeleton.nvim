local M = {}

function M.setup()
  require('skeleton.commands.splits').setup()
  require('skeleton.commands.cargowatch').setup()

  vim.api.nvim_create_user_command("CurrentBufferNumber", function()
    print(vim.api.nvim_get_current_buf())
  end, {
  })
end

return M
