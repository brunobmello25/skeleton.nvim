return {
  {
    "Weissle/persistent-breakpoints.nvim",
    config = function()
      require("persistent-breakpoints").setup({
        load_breakpoints_event = { "BufReadPost" },
      })

      vim.keymap.set("n", "<leader>db", '<cmd>lua require"persistent-breakpoints.api".toggle_breakpoint()<CR>')
      vim.keymap.set("n", "<leader>dc", '<cmd>lua require"persistent-breakpoints.api".set_conditional_breakpoint()<CR>')
    end,
  },
}
