return {
  {
    "nvim-telescope/telescope.nvim",
    version = false, -- telescope did only one release, so use HEAD for now
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local wk = require('which-key')

      vim.keymap.set('n', '<leader>ff', "<cmd>lua require('telescope.builtin').find_files({ hidden = true })<CR>",
        { desc = "Find files" })
      vim.keymap.set('n', "<leader>fg", '<cmd>Telescope live_grep<cr>', { desc = 'Live grep' })
      vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<cr>', { desc = 'Buffers' })
      vim.keymap.set('n', '<leader>fd', '<cmd>Telescope diagnostics<cr>', { desc = 'diagnostics' })
      vim.keymap.set('n', '<leader>fq', '<cmd>Telescope quickfix<cr>', { desc = 'List items in the quickfix list' })
      vim.keymap.set('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', { desc = 'List help tags' })

      wk.register({
        f = {
          name = 'Find',
          f = 'Find files',
          g = 'Live grep',
          b = 'Buffers',
          d = 'diagnostics',
          q = 'List items in the quickfix list',
          h = 'List help tags',
        },
      }, { prefix = '<leader>' })
    end
  },
}
