vim.g.mapleader = " "

require('globals')

require('bootstrap').run()

require('basics.keymaps').setup()
require('basics.sets').setup()

require("lazy").setup('plugins')

require('scripts').setup()
