if vim.g.vscode then
  require("skeleton.vscode")
else
  vim.g.mapleader = " "

  require('skeleton.globals')

  require('skeleton.bootstrap').run()

  require("lazy").setup('skeleton.plugins')

  require('skeleton.basics.sets').setup()
  require('skeleton.basics.keymaps').setup()

  require('skeleton.commands')
  require('skeleton.config.snippets.go')
end
