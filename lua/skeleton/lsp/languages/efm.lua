local M = {}

function M.setup()
  local lspconfig = require('lspconfig')
  local general = require('skeleton.lsp.languages.general')

  lspconfig.efm.setup {
    on_attach = function()
      general.set_keymaps()
    end,
    flags = {
      debounce_text_changes = 150,
    },
    init_options = {
      documentFormatting = true,
    },
    filetypes = { "python" },
    settings = {
      rootMarkers = { ".git/" },
      languages = {
        python = {
          {
            formatCommand = "black --quiet -",
            formatStdin = true,
          },
        },
      },
    }
  }
end

return M
