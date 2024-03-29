return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        -- ensure_installed = 'all',
        highlight = {
          enable = true,
        },
        indent = {
          enable = true,
        },
        autotag = {
          true,
        },
        auto_install = true,
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<leader><CR>",
            node_incremental = "<leader><CR>",
          },
        },
      })

      -- TODO: enable this when it's in main
      -- vim.opt.foldtext = vim.treesitter.foldtext()
    end,
  },

  {
    "nvim-treesitter/playground",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
  },
}
