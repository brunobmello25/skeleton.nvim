local M = {}


function M.config()
  require('nvim-treesitter.configs').setup({
    ensure_installed = 'all',
    highlight = {
      enable = true,
    },
    indent = {
      enable = true,
    },
    autotag = {
      true
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<leader><CR>",
        node_incremental = "<leader><CR>",
      },
    },
  })
end

return M
