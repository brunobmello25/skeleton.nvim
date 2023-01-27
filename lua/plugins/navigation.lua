return {
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    version = false, -- telescope did only one release, so use HEAD for now
    keys = {
      { "<leader>ff", '<cmd>Telescope find_files<cr>', desc = "Find Files" },
      { "<leader>fg", '<cmd>Telescope live_grep<cr>', desc = "Live Grep" },
      { "<leader>fb", '<cmd>Telescope buffers<cr>', desc = "Buffers" },
      { "<leader>fd", '<cmd>Telescope diagnostics<cr>', desc = "Diagnostics" },
    },
    dependencies = { 'nvim-lua/plenary.nvim' }
  },

  {
    {
      'ThePrimeagen/harpoon',
      dependencies = { 'nvim-lua/plenary.nvim' },
      keys = {
        { '<leader>1', "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", desc = "Go to first harpoon mark" },
        { '<leader>2', "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", desc = "Go to second harpoon mark" },
        { '<leader>3', "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", desc = "Go to third harpoon mark" },
        { '<leader>4', "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", desc = "Go to fourth harpoon mark" },
        { '<leader>5', "<cmd>lua require('harpoon.ui').nav_file(5)<cr>", desc = "Go to fifth harpoon mark" },
        { '<leader>6', "<cmd>lua require('harpoon.ui').nav_file(6)<cr>", desc = "Go to sixth harpoon mark" },
        { '<leader>7', "<cmd>lua require('harpoon.ui').nav_file(7)<cr>", desc = "Go to seventh harpoon mark" },
        { '<leader>8', "<cmd>lua require('harpoon.ui').nav_file(8)<cr>", desc = "Go to eighth harpoon mark" },
        { '<leader>9', "<cmd>lua require('harpoon.ui').nav_file(9)<cr>", desc = "Go to ninth harpoon mark" },

        { '<leader>ha', "<cmd> lua require(harpoon.mark).add_file()<cr>", desc = "Add file to harpoon" },
        { '<leader>hh', "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", desc = "Open harpoon files" }
      }
    }
  },

  { 'unblevable/quick-scope', },

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

      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1

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
  }
}
