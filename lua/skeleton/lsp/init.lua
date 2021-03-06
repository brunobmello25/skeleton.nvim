local M = {}

function M.setup()
  require('skeleton.lsp.installer').setup()

  require('skeleton.lsp.languages.golang').setup()
  require('skeleton.lsp.languages.lua').setup()
  require('skeleton.lsp.languages.ruby').setup()
  require('skeleton.lsp.languages.typescript').setup()
  require('skeleton.lsp.languages.bash').setup()
end

return M
