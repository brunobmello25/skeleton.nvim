local M = {}

function M.setup()
  require('skeleton.git.blame').setup()
  require('skeleton.git.conflict').setup()
  require('skeleton.git.neogit').setup()
end

return M
