local plugin_loader = require('skeleton.plugins')
local plugins = require('skeleton.plugins.list')

local is_bootstraped = plugin_loader.setup(plugins)

if is_bootstraped then
  return
end

local basics = require('skeleton.basics')
local keymaps = require('skeleton.keymaps')
local nvimtree = require('skeleton.nvimtree')
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
local neoclip = require('skeleton.neoclip')
local mason = require('skeleton.mason')
local smartsplits = require('skeleton.smartsplits')
local icons = require('skeleton.icons')

treesitter.setup()
quickscope.setup()
basics.setup()
keymaps.setup()
icons.setup()
nvimtree.setup()
comments.setup()
colors.setup()
copilot.setup()
harpoon.setup()
lsp.setup()
status.setup()
finder.setup()
todo.setup()
git.setup()
debugger.setup()
folding.setup()
autopairs.setup()
neoclip.setup()
mason.setup()
smartsplits.setup()
