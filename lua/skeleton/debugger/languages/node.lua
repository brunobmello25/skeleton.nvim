local dap = require('dap')

local M = {}

function M.setup()
  dap.adapters.node2 = {
    type = 'executable',
    command = 'node',
    args = { os.getenv('HOME') .. '/.local/share/nvim/mason/packages/node-debug2-adapter/out/src/nodeDebug.js' },
  }

  dap.adapters.chrome = {
    type = 'executable',
    command = 'node',
    args = { os.getenv('HOME') .. '/.local/share/nvim/mason/packages/vscode-chrome-debug/out/src/chromeDebug.js' },
  }

  local config = {
    {
      name = 'Launch',
      type = 'node2',
      request = 'launch',
      program = '${file}',
      cwd = vim.fn.getcwd(),
      sourceMaps = true,
      protocol = 'inspector',
      console = 'integratedTerminal',
    },
    {
      -- For this to work you need to make sure the node process is started with the `--inspect` flag.
      name = 'Attach to process',
      type = 'node2',
      request = 'attach',
      program = "${file}",
      cwd = vim.fn.getcwd(),
      port = 9229,
      souceMaps = true,
      protocol = 'inspector',
      webRoot = '${workspaceFolder}',
    },
  }

  dap.configurations.javascript = config
  dap.configurations.typescript = config
end

return M
