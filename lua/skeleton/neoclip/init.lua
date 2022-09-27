local M = {}

function M.setup()
  require('neoclip').setup()

  vim.api.nvim_set_keymap('n', '<leader>fy', ":lua require('telescope').extensions.neoclip.neoclip()<CR>",
    { noremap = true })
end

return M
