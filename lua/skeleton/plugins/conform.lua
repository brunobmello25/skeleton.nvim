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
      })

      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*",
        callback = function(args)
          require("conform").format({ bufnr = args.buf })
        end,
      })
    end,
  },
}
