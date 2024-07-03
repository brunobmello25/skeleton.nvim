vim.g.mapleader = " "

require('skeleton.globals')

require('skeleton.bootstrap')

require("lazy").setup('skeleton.plugins')

require('skeleton.basics.sets')
require('skeleton.basics.keymaps')

require('skeleton.commands')
require('skeleton.config.snippets.go')
