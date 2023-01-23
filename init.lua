local basics = require('skeleton.basics')
basics.setup()

local bootstraped = require('skeleton.plugins').bootstrap()
if bootstraped then
  return
end

local movements = require('skeleton.movements')
local colors = require('skeleton.colors')
local lsp = require('skeleton.lsp')
local status = require('skeleton.status')
local git = require('skeleton.git')
local debugger = require('skeleton.debugger')
local icons = require('skeleton.icons')
local editing = require('skeleton.editing')

lsp.setup()
editing.setup()
movements.setup()
icons.setup()
colors.setup()
status.setup()
git.setup()
debugger.setup()
