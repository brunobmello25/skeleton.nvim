local M = {}

function M.setup()
  require('nvim-treesitter.configs').setup {
    ensure_installed = "all",
    highlight = {
      enable = true
    },
    autotag = {
      enable = true
    },
    context_commentstring = {
      enable = true,
      config = {
        typescript = { __default = '// %s', __multiline = '/* %s */' }
      }
    }
  }
end

return M
