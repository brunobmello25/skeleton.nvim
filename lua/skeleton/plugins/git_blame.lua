return {
  {
    "f-person/git-blame.nvim",
    config = function()
      require("gitblame").setup({
        enabled = false,
        ignored_filetypes = { "netrw" },
      })

      vim.api.nvim_create_user_command("GBT", "GitBlameToggle", {})
    end,
  },
}
