return {
  {
    "nvim-telescope/telescope.nvim",
    version = false, -- telescope did only one release, so use HEAD for now
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      -- customize ripgrep args
      require('telescope').setup()

      vim.keymap.set('n', '<leader>ff', "<cmd>lua require('telescope.builtin').find_files()<CR>", { desc = "Find files" })
      vim.keymap.set('n', '<leader>fF', "<cmd>lua require('telescope.builtin').find_files({ hidden = true })<CR>",
        { desc = "Find files (include hidden)" })
      vim.keymap.set('n', "<leader>fg", '<cmd>Telescope live_grep<cr>', { desc = 'Live grep' })
      vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<cr>', { desc = 'Buffers' })
      vim.keymap.set('n', '<leader>fd', '<cmd>Telescope diagnostics<cr>', { desc = 'diagnostics' })
      vim.keymap.set('n', '<leader>fq', '<cmd>Telescope quickfix<cr>', { desc = 'List items in the quickfix list' })
      vim.keymap.set('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', { desc = 'List help tags' })
      vim.keymap.set('n', '<leader>fm', '<cmd>Telescope marks<cr>', { desc = 'List marks' })
    end
  },

  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
    config = function()
      require("todo-comments").setup({})
      vim.keymap.set('n', '<leader>ft', '<cmd>TodoTelescope<CR>', { desc = "Search for TODOs" })
    end
  },

  {
    "AckslD/nvim-neoclip.lua",
    dependencies = {
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
              replay = false,   -- replay a macro
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

      vim.keymap.set('n', '<leader>fy', "<cmd>lua require('telescope').extensions.neoclip.neoclip()<cr>",
        { desc = "List yanked items" })
    end
  }
}
