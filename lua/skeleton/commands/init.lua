local M = {}

function M.setup()
  require('skeleton.commands.splits').setup()
  require('skeleton.commands.cargowatch').setup()
end

return M
