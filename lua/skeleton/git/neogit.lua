local M = {}

function M.setup()
  require('neogit').setup({
    disable_commit_confirmation = true,
    integrations = {
      diffview = true,
    },
  })
end

return M
