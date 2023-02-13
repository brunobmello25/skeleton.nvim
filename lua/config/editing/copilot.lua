local M = {}

function M.config()
  local copilot = require('copilot')
  local suggestion = require('copilot.suggestion')

  copilot.setup({
    suggestion = {
      auto_trigger = true
    },
  })

  vim.keymap.set('i', '<C-u>', function() suggestion.accept() end, {})
end

return M
