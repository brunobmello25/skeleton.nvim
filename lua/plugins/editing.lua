return {
  {
    'windwp/nvim-autopairs',
    config = function()
      require("nvim-autopairs").setup({})
    end
  },

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

  {
    'github/copilot.vim',
    init = function()
      vim.g.copilot_no_tab_map = true

      vim.keymap.set('i', '<C-u>', 'copilot#Accept("<CR>")')
    end,
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
  },

  -- autorun :noh when cursor moves
  { 'romainl/vim-cool' },

  {
    'windwp/nvim-ts-autotag',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
      require('nvim-ts-autotag').setup()
    end
  },

  { 'styled-components/vim-styled-components' },

  {
    'ggandor/leap.nvim',
    dependencies = { 'tpope/vim-repeat' },
    config = function()
      require('leap').add_default_mappings()
    end
  }
}
