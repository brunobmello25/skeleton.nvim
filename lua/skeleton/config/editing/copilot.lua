local M = {}

function M.config()
  local copilot = require('copilot')
  local suggestion = require('copilot.suggestion')
  local api = require("copilot.api")
  local lualine = require('lualine')

  copilot.setup({
    suggestion = {
      auto_trigger = true
    },
    filetypes = {
      ["*"] = true
    }
  })

  vim.keymap.set('i', '<C-u>', function() suggestion.accept() end, {})
end

return M
