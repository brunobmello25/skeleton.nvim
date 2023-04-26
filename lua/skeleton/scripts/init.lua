local M = {}

function M.setup()
  require('skeleton.scripts.autorun')
  require('skeleton.scripts.cargowatch')
  require('skeleton.scripts.terminal')
  require('skeleton.scripts.splits').setup()
end

return M
