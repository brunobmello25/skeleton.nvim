local breakpoints = require('dap.breakpoints')

local store_path = vim.fn.stdpath('data') .. '/dap-breakpoints.json'

local M = {}

local function store()
  local bps = {}
  local breakpoints_by_buf = breakpoints.get()
  for buf, buf_bps in pairs(breakpoints_by_buf) do
    bps[tostring(buf)] = buf_bps
  end
  local fp, err = io.open(store_path, 'w')

  if err ~= nil then
    print(err)
    return
  end

  fp:write(vim.fn.json_encode(bps))
  fp:close()
end

local function load()
  local fp, err = io.open(store_path, 'r')

  if err ~= nil then
    print(err)
    return
  end

  local content = fp:read('*a')
  local bps = vim.fn.json_decode(content)

  for buf, buf_bps in pairs(bps) do
    for _, bp in pairs(buf_bps) do
      local line = bp.line

      local opts = {
        condition = bp.condition,
        log_message = bp.logMessage,
        hit_condition = bp.hitCondition
      }

      breakpoints.set(opts, tonumber(buf), line)
    end
  end
end


function M.setup()
  vim.api.nvim_create_user_command('SaveBreakpoints', store, {})

  vim.api.nvim_create_user_command('LoadBreakpoints', load, {})

  vim.api.nvim_create_autocmd({ "VimLeavePre" }, {
    callback = function()
      store()
    end
  })

  vim.api.nvim_create_autocmd({ "VimEnter" }, {
    callback = function()
      load(current_buffer)
    end
  })
end

return M
