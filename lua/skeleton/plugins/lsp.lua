return {
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    dependencies = {
      -- LSP Support
      { "neovim/nvim-lspconfig" }, -- Required
      {                            -- Optional
        "williamboman/mason.nvim",
        config = function()
          require("mason").setup()
        end
      },
      { "williamboman/mason-lspconfig.nvim" }, -- Optional

      -- Autocompletion
      {
        "hrsh7th/nvim-cmp",
        dependencies = {

          "tpope/vim-dadbod",
          "kristijanhusak/vim-dadbod-completion",
          "kristijanhusak/vim-dadbod-ui",
        }
      },                          -- Required
      { "hrsh7th/cmp-nvim-lsp" }, -- Required
      {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        build = "make install_jsregexp",
        dependencies = { "rafamadriz/friendly-snippets" },
      }, -- Required
      { "hrsh7th/cmp-buffer" },
      { "saadparwaiz1/cmp_luasnip" },
      { "rafamadriz/friendly-snippets" },

      {
        "simrat39/rust-tools.nvim",
        dependencies = {
          "neovim/nvim-lspconfig",
          "nvim-lua/plenary.nvim",
          "mfussenegger/nvim-dap",
        },
      },
    },
    config = require("skeleton.config.lsp.init").config,
  },
}
