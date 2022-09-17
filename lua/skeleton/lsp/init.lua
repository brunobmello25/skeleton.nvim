local M = {}

function M.setup()
  require('skeleton.lsp.installer').setup()

  require('skeleton.lsp.languages.golang').setup()
  require('skeleton.lsp.languages.lua').setup()
  require('skeleton.lsp.languages.ruby').setup()
  require('skeleton.lsp.languages.typescript').setup()
  require('skeleton.lsp.languages.bash').setup()
  require('skeleton.lsp.languages.json').setup()
  require('skeleton.lsp.languages.python').setup()
  require('skeleton.lsp.languages.java').setup()
  require('skeleton.lsp.languages.efm').setup()
end

return M
