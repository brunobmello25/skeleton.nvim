local M = {}

function M.setup()
  require('skeleton.editing.autopairs').setup()

  require('skeleton.editing.comments').setup()

  require('skeleton.editing.copilot').setup()

  require('skeleton.editing.neoclip').setup()
end

return M
