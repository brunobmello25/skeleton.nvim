local plugin_loader = require('skeleton.plugins')
local plugins = require('skeleton.plugins.list')

local lsp = require('skeleton.lsp')

plugin_loader.setup(plugins)

lsp.setup()