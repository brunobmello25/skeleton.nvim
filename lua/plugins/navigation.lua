return {
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    version = false, -- telescope did only one release, so use HEAD for now
    keys = {
      { "<leader>ff", "<cmd>lua require('telescope.builtin').find_files({ hidden = true })<CR>", desc = "Find Files" },
      { "<leader>fg", '<cmd>Telescope live_grep<cr>', desc = "Live Grep" },
      { "<leader>fb", '<cmd>Telescope buffers<cr>', desc = "Buffers" },
      { "<leader>fd", '<cmd>Telescope diagnostics<cr>', desc = "Diagnostics" },
    },
    dependencies = { 'nvim-lua/plenary.nvim' }
  },

  {
    {
      'ThePrimeagen/harpoon',
      lazy = false,
      dependencies = { 'nvim-lua/plenary.nvim' },
      config = function()
        vim.keymap.set('n', '<leader>1', "<cmd>lua require('harpoon.ui').nav_file(1)<CR>", { desc = "Go to harpoon 1" })
        vim.keymap.set('n', '<leader>2', "<cmd>lua require('harpoon.ui').nav_file(2)<CR>", { desc = "Go to harpoon 2" })
        vim.keymap.set('n', '<leader>3', "<cmd>lua require('harpoon.ui').nav_file(3)<CR>", { desc = "Go to harpoon 3" })
        vim.keymap.set('n', '<leader>4', "<cmd>lua require('harpoon.ui').nav_file(4)<CR>", { desc = "Go to harpoon 4" })
        vim.keymap.set('n', '<leader>5', "<cmd>lua require('harpoon.ui').nav_file(5)<CR>", { desc = "Go to harpoon 5" })
        vim.keymap.set('n', '<leader>6', "<cmd>lua require('harpoon.ui').nav_file(6)<CR>", { desc = "Go to harpoon 6" })
        vim.keymap.set('n', '<leader>7', "<cmd>lua require('harpoon.ui').nav_file(7)<CR>", { desc = "Go to harpoon 7" })
        vim.keymap.set('n', '<leader>8', "<cmd>lua require('harpoon.ui').nav_file(8)<CR>", { desc = "Go to harpoon 8" })
        vim.keymap.set('n', '<leader>9', "<cmd>lua require('harpoon.ui').nav_file(9)<CR>", { desc = "Go to harpoon 9" })
        vim.keymap.set('n', '<leader>ha', "<cmd>lua require('harpoon.mark').add_file()<CR>",
          { desc = "Add file to harpoon" })
        vim.keymap.set('n', '<leader>hh', "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>",
          { desc = "Open harpoon menu" })
      end,
    }
  },

  {
    'unblevable/quick-scope',
    init = function()
      vim.g.qs_highlight_on_keys = { 'f', 'F', 't', 'T' }

      vim.cmd([[
          augroup qs_colors
            autocmd!
            autocmd ColorScheme * highlight QuickScopePrimary guifg='#33ff6d' gui=underline ctermfg=155 cterm=underline
            autocmd ColorScheme * highlight QuickScopeSecondary guifg='#59e9ff' gui=underline ctermfg=81 cterm=underline
          augroup END
        ]])
    end
  },

  {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly', -- optional, updated every week. (see issue #1193)
    keys = {
      { '<leader>E', '<cmd>NvimTreeToggle<cr>', desc = "Toggle NvimTree" },
      { '<leader>e', '<cmd>NvimTreeFindFileToggle<cr>', desc = "Toggle NvimTree in current file" },
    },
    config = function()
      require('nvim-tree').setup({
        respect_buf_cwd = true,
        view = {
          adaptive_size = true,
        }
      })
    end,
    init = function()
      -- disable netrw at the very start of your init.lua (strongly advised)
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1

      -- set termguicolors to enable highlight groups
      vim.opt.termguicolors = true
    end
  },

  {
    'mrjones2014/smart-splits.nvim',
    config = function()
      require('smart-splits').setup({})
    end,
    keys = {
      { '<A-h>', "<cmd> lua require('smart-splits').resize_left()<cr>", desc = "Resize left" },
      { '<A-j>', "<cmd> lua require('smart-splits').resize_down()<cr>", desc = "Resize down" },
      { '<A-k>', "<cmd> lua require('smart-splits').resize_up()<cr>", desc = "Resize up" },
      { '<A-l>', "<cmd> lua require('smart-splits').resize_right()<cr>", desc = "Resize right" },

      { '<C-h>', "<cmd> lua require('smart-splits').move_cursor_left()<cr>", desc = "Move left" },
      { '<C-j>', "<cmd> lua require('smart-splits').move_cursor_down()<cr>", desc = "Move down" },
      { '<C-k>', "<cmd> lua require('smart-splits').move_cursor_up()<cr>", desc = "Move up" },
      { '<C-l>', "<cmd> lua require('smart-splits').move_cursor_right()<cr>", desc = "Move right" },
    }
  },

  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("todo-comments").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        vim.keymap.set('n', '<leader>ft', '<cmd>TodoTelescope<CR>')
      }
    end
  },

  { 'psliwka/vim-smoothie' }
}
