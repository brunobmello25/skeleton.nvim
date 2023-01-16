local M = {}

function M.setup()
    require('skeleton.movements.harpoon').setup()
    require('skeleton.movements.quickscope').setup()
    require('skeleton.movements.todo').setup()
    require('skeleton.movements.nvimtree').setup()
    require('skeleton.movements.smartsplits').setup()
    require('skeleton.movements.telescope').setup()
end

return M
