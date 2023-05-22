return {
  {
    'zbirenbaum/copilot.lua',
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      local copilot = require('copilot')
      local suggestion = require('copilot.suggestion')

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
  },
}
