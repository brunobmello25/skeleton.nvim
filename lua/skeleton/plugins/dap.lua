return {
  {
    "mfussenegger/nvim-dap",
    config = function()
      vim.keymap.set('n', '<F10>', '<cmd>lua require"dap".step_over()<CR>')
      vim.keymap.set('n', '<F11>', '<cmd>lua require"dap".step_into()<CR>')
      vim.keymap.set('n', '<F12>', '<cmd>lua require"dap".step_out()<CR>')
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
        ensure_installed = {
          "python", -- debugpy
          "delve",  -- golang
        },
      })
    end
  },

  {
    'leoluz/nvim-dap-go',
    dependencies = {
      'mfussenegger/nvim-dap',
      'rcarriga/nvim-dap-ui',
    },
    config = function()
      require('dap-go').setup()
    end
  },

  {
    'mfussenegger/nvim-dap-python',
    dependencies = {
      'mfussenegger/nvim-dap',
      'rcarriga/nvim-dap-ui',
    },
    config = function()
      local dap = require('dap')
      local dap_python = require('dap-python')

      local path
      local venv_path = vim.fn.getcwd() .. '/venv/bin/python'
      local mason_path = require("mason-registry").get_package("debugpy"):get_install_path() .. '/venv/bin/python'

      if vim.fn.filereadable(venv_path) == 1 then
        path = venv_path
      elseif vim.fn.filereadable(mason_path) then
        path = mason_path
      elseif vim.fn.exepath('python') ~= '' then
        path = vim.fn.exepath('python')
      elseif vim.fn.exepath('python3') ~= '' then
        path = vim.fn.exepath('python3')
      else
        path = 'python'
      end
      dap_python.setup(path)
    end
  },

  {
    'theHamsta/nvim-dap-virtual-text',
    dependencies = {
      'mfussenegger/nvim-dap',
      'nvim-treesitter/nvim-treesitter'
    },
    config = function()
      require("nvim-dap-virtual-text").setup()
    end
  }
}
