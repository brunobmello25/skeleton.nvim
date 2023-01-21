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
local colors = require('skeleton.colors')
local lsp = require('skeleton.lsp')
local status = require('skeleton.status')
local git = require('skeleton.git')
local debugger = require('skeleton.debugger')
local icons = require('skeleton.icons')
local editing = require('skeleton.editing')

basics.setup()
keymaps.setup()
lsp.setup()
editing.setup()
movements.setup()
icons.setup()
colors.setup()
status.setup()
git.setup()
debugger.setup()
