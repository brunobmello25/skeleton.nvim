local M = {}

function M.setup()

  require('nvim_comment').setup({
    operator_mapping = "<leader>/",
    hook = function()
      local filetype = vim.api.nvim_buf_get_option(0, "filetype")

      if filetype == "typescriptreact" or filetype == "javascriptreact" then
        require("ts_context_commentstring.internal").update_commentstring({
          key = '__multiline'
        })
      end
    end
  })
end

return M
