return {
  {
    "mfussenegger/nvim-dap",
    config = function()
      local wk = require('which-key')

      vim.keymap.set('n', '<F10>', '<cmd>lua require"dap".step_over()<CR>')
      vim.keymap.set('n', '<F11>', '<cmd>lua require"dap".step_into()<CR>')
      vim.keymap.set('n', '<F12>', '<cmd>lua require"dap".step_out()<CR>')
      vim.keymap.set('n', '<F5>', '<cmd>lua require"dap".continue()<CR>')
      vim.keymap.set('n', '<leader>db', '<cmd>lua require"dap".toggle_breakpoint()<CR>')
      vim.keymap.set('n', '<leader>dc',
        '<cmd>lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>')

      vim.keymap.set('n', '<leader>du', '<cmd>lua require"dapui".toggle()<CR>')

      wk.register({
        d = {
          name = "Debugger",
          b = 'Toggle breakpoint',
          c = 'Toggle conditional breakpoint',
        }
      }, { prefix = '<leader>' })
    end
  },

  {
    'rcarriga/nvim-dap-ui',
    config = function()
      local dapui = require('dapui')
      local wk = require('which-key')

      dapui.setup()

      wk.register({
        d = {
          name = "Debugger",
          u = 'Toggle UI',
        }
      }, { prefix = '<leader>' })
    end
  },

  {
    'jay-babu/mason-nvim-dap.nvim',
    dependencies = {
      'williamboman/mason.nvim',
      'mfussenegger/nvim-dap',
    },
    config = function()
      require("mason-nvim-dap").setup({
        ensure_installed = { "python", "rust" },
        handlers = {
          function(config)
            -- all sources with no handler get passed here

            -- Keep original functionality
            require('mason-nvim-dap').default_setup(config)
          end,
          python = function(config)
            config.adapters = {
              type = "executable",
              command = "python",
              args = {
                "-m",
                "debugpy.adapter",
              },
            }
            require('mason-nvim-dap').default_setup(config) -- don't forget this!
          end,
        },
      })
    end
  }
}
