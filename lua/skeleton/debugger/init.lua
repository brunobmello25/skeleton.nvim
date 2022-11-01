local M = {}

function M.setup()
  local dapui = require('dapui')
  local nvim_dap_virtual_text = require('nvim-dap-virtual-text')
  local languages = require('skeleton.debugger.languages')

  vim.keymap.set('n', '<F5>', "<cmd>lua require('dap').continue()<CR>")
  vim.keymap.set('n', '<F10>', "<cmd>lua require('dap').step_into()<CR>")
  vim.keymap.set('n', '<F11>', "<cmd>lua require('dap').step_over()<CR>")
  vim.keymap.set('n', '<F12>', "<cmd>lua require('dap').step_out()<CR>")
  vim.keymap.set('n', '<leader>b', "<cmd>lua require('dap').toggle_breakpoint()<CR>")

  dapui.setup()
  vim.keymap.set('n', '<leader>B', "<cmd>lua require('dapui').toggle()<CR>")

  nvim_dap_virtual_text.setup()

  languages.golang.setup()
  languages.node.setup()
end

return M
