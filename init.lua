local plugin_loader = require('skeleton.plugins')
local plugins = require('skeleton.plugins.list')

plugin_loader.setup(plugins)

if plugin_loader.is_bootstrap then
  plugin_loader.print_bootstrap_warn_message()

  return
end

local movements = require('skeleton.movements')
local basics = require('skeleton.basics')
local keymaps = require('skeleton.keymaps')
local comments = require('skeleton.comments')
local colors = require('skeleton.colors')
local copilot = require('skeleton.copilot')
local lsp = require('skeleton.lsp')
local status = require('skeleton.status')
local git = require('skeleton.git')
local debugger = require('skeleton.debugger')
local folding = require('skeleton.folding')
local autopairs = require('skeleton.autopairs')
local neoclip = require('skeleton.neoclip')
local icons = require('skeleton.icons')

basics.setup()
keymaps.setup()
lsp.setup()
movements.setup()
icons.setup()
comments.setup()
colors.setup()
copilot.setup()
status.setup()
git.setup()
debugger.setup()
folding.setup()
autopairs.setup()
neoclip.setup()
