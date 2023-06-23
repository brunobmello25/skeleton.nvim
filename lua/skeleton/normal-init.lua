vim.g.mapleader = " "

require('skeleton.globals')

require('skeleton.bootstrap').run()

require('skeleton.basics.keymaps').setup()
require('skeleton.basics.sets').setup()

require("lazy").setup('skeleton.plugins')

require('skeleton.commands').setup()
