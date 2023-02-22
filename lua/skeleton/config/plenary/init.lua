local M = {}


function M.init()
  vim.keymap.set('n', '<leader>t', function()
    if vim.bo.filetype == 'lua' then
      return '<Plug>PlenaryTestFile'
    else
      print 'Not in a lua file'
      return ''
    end
  end, { expr = true })
end

return M
