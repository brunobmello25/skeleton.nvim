return {
  {
    'terrortylor/nvim-comment',
    dependencies = {
      {
        'JoosepAlviste/nvim-ts-context-commentstring',
        dependencies = { 'nvim-treesitter/nvim-treesitter' }
      }
    },
    config = function()
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
  },
}
