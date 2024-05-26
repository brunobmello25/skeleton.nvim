return {
  {
    "stevearc/conform.nvim",
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          lua = { "stylua" },

          javascript = { { "prettierd", "prettier" } },
          typescript = { { "prettier", "prettierd" } },
          typescriptreact = { { "prettier", "prettierd" } },
          javascriptreact = { { "prettier", "prettierd" } },
          yaml = { "prettier", "prettierd" },
          html = { "prettier", "prettierd" },
          css = { "prettier", "prettierd" },

          json = { "jq" },

          python = { "autopep8" },

          gdscript = { "gdformat" },
        },

        format_on_save = {
          lsp_fallback = true,
        },
      })
    end,
  },
}
