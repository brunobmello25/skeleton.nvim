return {
  {
    'windwp/nvim-autopairs',
    config = function()
      require("nvim-autopairs").setup({})
    end
  },

  {
    'terrortylor/nvim-comment',
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

  {
    'github/copilot.vim',
    init = function()
      vim.g.copilot_no_tab_map = true

      vim.keymap.set('n', '<C-u>', 'copilot#Accept("<CR>")')
    end,
    -- keys = {
    --   { '<C-u>', 'copilot#Accept("<CR>")', mode = "i" }
    -- }
  },

  {
    "AckslD/nvim-neoclip.lua",
    requires = {
      { 'nvim-telescope/telescope.nvim' },
    },
    config = function()
      require('neoclip').setup({
        keys = {
          telescope = {
            i = {
              select = '<cr>',
              paste = false,
              paste_behind = false,
              replay = false, -- replay a macro
              delete = '<c-d>', -- delete an entry
              custom = {},
            },
            n = {
              select = '<cr>',
              paste = false,
              --- It is possible to map to more than one key.
              -- paste = { 'p', '<c-p>' },
              paste_behind = false,
              replay = false,
              delete = 'd',
              custom = {},
            },
          }
        }
      })

      vim.keymap.set('n', '<leader>fy', "<cmd>lua require('telescope').extensions.neoclip.neoclip()<cr>")
    end,
  }
}
