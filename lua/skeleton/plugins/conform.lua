return {
  {
    "stevearc/conform.nvim",
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          lua = { "stylua" },
          -- Conform will run multiple formatters sequentially
          python = { "isort", "black" },
          -- Use a sub-list to run only the first available formatter
          javascript = { { "prettierd", "prettier" } },
          typescript = { { "prettier", "prettierd" } },
          typescriptreact = { { "prettier", "prettierd" } },
          javascriptreact = { { "prettier", "prettierd" } },

          rust = { "rustfmt" },

          go = { "gofmt", "goimports" },

          json = { "jq" },
          yaml = { "prettier", "prettierd" },
        },

        format_on_save = {
          lsp_fallback = true,
        },
      })
    end,
  },
}
