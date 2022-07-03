local plugin_loader = require('skeleton.plugins')
local plugins = require('skeleton.plugins.list')
local basics = require('skeleton.basics')
local keymaps = require('skeleton.keymaps')

plugin_loader.setup(plugins)
basics.setup()
keymaps.setup()
