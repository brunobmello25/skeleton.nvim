local M = {}

function M.setup()
  require('skeleton.git.blame').setup()
  require('skeleton.git.conflict').setup()
end

return M

