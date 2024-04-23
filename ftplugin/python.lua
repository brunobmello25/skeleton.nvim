vim.keymap.set("n", "<leader>dt", function()
  require('dap-python').test_method()
end, { desc = "Debug local test" })
