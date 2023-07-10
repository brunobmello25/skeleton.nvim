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
      local dap = require('dap')
      local dap_python = require('dap-python')

      local venv_path = vim.fn.getcwd() .. '/venv/bin/python'
      local mason_path = require('mason-registry').get_package('debugpy'):get_install_path() .. '/venv/bin/python'

      local path = venv_path
      if vim.fn.filereadable(path) == 0 then
        path = mason_path
      end
      if vim.fn.filereadable(path) == 0 then
        path = vim.fn.exepath('python')
      end

      dap_python.setup(path)

      table.insert(dap.configurations.python, {
        name = "Launch Flask server",
        type = "python",
        request = "launch",
        console = "integratedTerminal",
        cwd = "${workspaceFolder}",
        program = path,
        args = {
          "run",
          "flask",
          "--no-debug",
          "run",
        },
      })
    end
  }
}
