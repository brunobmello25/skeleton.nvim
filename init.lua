vim.g.mapleader = " "

require('bootstrap').run()

require('basics.keymaps').setup()
require('basics.sets').setup()

require("lazy").setup('plugins')
