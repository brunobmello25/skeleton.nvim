local plugin_loader = require('skeleton.plugins')
local plugins = require('skeleton.plugins.list')
local basics = require('skeleton.basics')
local keymaps = require('skeleton.keymaps')
local comments = require('skeleton.comments')
local colors = require('skeleton.colors')
local copilot = require('skeleton.copilot')
local harpoon = require('skeleton.harpoon')
local lsp = require('skeleton.lsp')
local status = require('skeleton.status')
local quickscope = require('skeleton.quickscope')
local finder = require('skeleton.finder')
local todo = require('skeleton.todo')
local treesitter = require('skeleton.treesitter')
local git = require('skeleton.git')
local debugger = require('skeleton.debugger')
local folding = require('skeleton.folding')
local autopairs = require('skeleton.autopairs')

plugin_loader.setup(plugins)
quickscope.setup()
basics.setup()
keymaps.setup()
comments.setup()
colors.setup()
copilot.setup()
harpoon.setup()
lsp.setup()
status.setup()
finder.setup()
todo.setup()
treesitter.setup()
git.setup()
debugger.setup()
folding.setup()
autopairs.setup()
