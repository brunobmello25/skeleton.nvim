return {
  {
    "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")
      local mason_registry = require("mason-registry")

      vim.keymap.set("n", "<F10>", '<cmd>lua require"dap".step_into()<CR>')
      vim.keymap.set("n", "<F11>", '<cmd>lua require"dap".step_over()<CR>')
      vim.keymap.set("n", "<F12>", '<cmd>lua require"dap".step_out()<CR>')
      vim.keymap.set("n", "<F5>", function()
        if vim.fn.filereadable(".vscode/launch.json") == 1 then
          require("dap.ext.vscode").load_launchjs()
        end

        require("dap").continue()
      end)

      vim.keymap.set("n", "<leader>du", '<cmd>lua require"dapui".toggle()<CR>')

      -- reset dap ui
      vim.keymap.set("n", "<leader>dr", function()
        local dapui = require("dapui")
        dapui.close()
        dapui.open({ reset = true })
      end)

      vim.keymap.set("n", "<leader>de", '<cmd>lua require"dapui".eval()<CR>')

      vim.keymap.set("n", "<leader>db", '<cmd>lua require"dap".toggle_breakpoint()<CR>')
      vim.keymap.set(
        "n",
        "<leader>dc",
        '<cmd>lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>'
      )

      vim.api.nvim_create_user_command("DapDisconnect", function()
        require("dap").disconnect()
        require("dapui").close()
      end, {})

      local node_debug_path = mason_registry.get_package("node-debug2-adapter"):get_install_path()
        .. "/out/src/nodeDebug.js"

      dap.adapters.node2 = {
        type = "executable",
        command = "node",
        args = {
          node_debug_path,
        },
      }

      dap.configurations.typescript = {
        {
          name = "attach to typescript",
          type = "node2",
          request = "attach",
          port = function()
            return tonumber(vim.fn.input("Debug Port: ", "9229"))
          end,
          cwd = vim.fn.getcwd(),
          sourceMaps = true,
          skipFiles = { "<node_internals>/**", "node_modules/**" },
        },
      }
    end,
  },

  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup()

      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end

      -- TODO: finish
      -- require('skeleton.config.dap.save_breakpoints').setup()
    end,
  },

  {
    "jay-babu/mason-nvim-dap.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap",
    },
    config = function()
      require("mason-nvim-dap").setup({
        ensure_installed = {
          "python", -- debugpy
          "delve", -- golang
          "codelldb", -- rust, c, c++
        },
      })
    end,
  },

  {
    "leoluz/nvim-dap-go",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
    config = function()
      require("dap-go").setup()
    end,
  },

  {
    "mfussenegger/nvim-dap-python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
    config = function()
      local dap_python = require("dap-python")

      local path
      local venv_path = vim.fn.getcwd() .. "/venv/bin/python"
      local mason_path = require("mason-registry").get_package("debugpy"):get_install_path() .. "/venv/bin/python"

      if vim.fn.filereadable(venv_path) == 1 then
        path = venv_path
      elseif vim.fn.filereadable(mason_path) then
        path = mason_path
      elseif vim.fn.exepath("python") ~= "" then
        path = vim.fn.exepath("python")
      elseif vim.fn.exepath("python3") ~= "" then
        path = vim.fn.exepath("python3")
      else
        path = "python"
      end
      dap_python.setup(path)
    end,
  },

  {
    "theHamsta/nvim-dap-virtual-text",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("nvim-dap-virtual-text").setup()
    end,
  },
}
