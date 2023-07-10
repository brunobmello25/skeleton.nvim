return {
  {
    "mfussenegger/nvim-dap",
    config = function()
      vim.keymap.set('n', '<F10>', '<cmd>lua require"dap".step_over()<CR>')
      vim.keymap.set('n', '<F11>', '<cmd>lua require"dap".step_into()<CR>')
      vim.keymap.set('n', '<F12>', '<cmd>lua require"dap".step_out()<CR>')
      vim.keymap.set('n', '<F5>', '<cmd>lua require"dap".continue()<CR>')
      vim.keymap.set('n', '<F5>', function()
        if vim.fn.filereadable(".vscode/launch.json") then
          require("dap.ext.vscode").load_launchjs()
        end

        require('dap').continue()
      end)
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
    -- ft = { 'python' },
    config = function()
      local dap = require('dap')
      local dap_python = require('dap-python')

      local path = vim.fn.getcwd() .. '/venv/bin/python'
      dap_python.setup(path)


      -- table.insert(dap.configurations.python, {
      --   name = "Launch Flask server",
      --   type = "python",
      --   request = "launch",
      --   console = "integratedTerminal",
      --   cwd = "${workspaceFolder}",
      --   program = path,
      --   args = {
      --     "-m",
      --     "flask",
      --     "run",
      --     "--debug",
      --   },
      -- })
    end
  }
}
