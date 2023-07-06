return {
  {
    "mfussenegger/nvim-dap",
    config = function()
      vim.keymap.set('n', '<F10>', '<cmd>lua require"dap".step_over()<CR>')
      vim.keymap.set('n', '<F11>', '<cmd>lua require"dap".step_into()<CR>')
      vim.keymap.set('n', '<F12>', '<cmd>lua require"dap".step_out()<CR>')
      vim.keymap.set('n', '<F5>', '<cmd>lua require"dap".continue()<CR>')
      vim.keymap.set('n', '<leader>db', '<cmd>lua require"dap".toggle_breakpoint()<CR>')
      vim.keymap.set('n', '<leader>dc',
        '<cmd>lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>')

      vim.keymap.set('n', '<leader>du', '<cmd>lua require"dapui".toggle()<CR>')
    end
  },

  {
    'rcarriga/nvim-dap-ui',
    dependencies = {
      'mfussenegger/nvim-dap',
    },
    config = function()
      local dap = require('dap')
      local dapui = require('dapui')
      dapui.setup()

      dap.listeners.after.event_initialized['dapui_config'] = function()
        dapui.open()
      end

      dap.listeners.before.event_terminated['dapui_config'] = function()
        dapui.close()
      end

      dap.listeners.before.event_exited['dapui_config'] = function()
        dapui.close()
      end
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
      })
    end
  },

  {
    'mfussenegger/nvim-dap-python',
    dependencies = {
      'mfussenegger/nvim-dap',
      'rcarriga/nvim-dap-ui',
    },
    ft = { 'python' },
    config = function()
      -- local path = vim.fn.getcwd() .. '/.venv/bin/python'
      -- require('dap-python').setup(path)

      local path = require("mason-registry").get_package("debugpy"):get_install_path()
      require("dap-python").setup(path .. "/venv/bin/python")
    end
  }
}
