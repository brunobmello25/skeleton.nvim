local breakpoints = require('dap.breakpoints')

local store_path = vim.fn.stdpath('data') .. '/dap-breakpoints.json'

local M = {}

local function create_file_if_not_exists(path)
  local fp, err = io.open(path, 'r')

  if err ~= nil then
    fp = io.open(path, 'w')
    fp:write("[]")
    fp:close()
  end
end

local function store()
  local bps = {}

  local breakpoints_by_buf = breakpoints.get()

  for buf, buf_bps in pairs(breakpoints_by_buf) do
    local filename = vim.api.nvim_buf_get_name(buf)
    bps[filename] = buf_bps
  end
  local fp, err = io.open(store_path, 'w')

  if err ~= nil then
    return
  end

  fp:write(vim.fn.json_encode(bps))
  fp:close()
end

local function load(bufnr)
  create_file_if_not_exists(store_path)

  local fp, err = io.open(store_path, 'r')

  if err ~= nil then
    print(err)
    return
  end

  local filename = vim.api.nvim_buf_get_name(bufnr)

  local content = fp:read('*a')
  local bps = vim.fn.json_decode(content)
  local file_bps = bps[filename]

  if file_bps == nil then
    return
  end

  for _, bp in pairs(file_bps) do
    local line = bp.line

    local opts = {
      condition = bp.condition,
      log_message = bp.logMessage,
      hit_condition = bp.hitCondition
    }

    breakpoints.set(opts, tonumber(buf), line)
  end
end


function M.setup()
  vim.api.nvim_create_user_command('SaveBreakpoints', store, {})

  vim.api.nvim_create_user_command('LoadBreakpoints', function()
    load(vim.api.nvim_get_current_buf())
  end, {})

  vim.api.nvim_create_autocmd('BufEnter', {
    callback = function()
      load(vim.api.nvim_get_current_buf())
    end
  })

  vim.api.nvim_create_autocmd('VimLeave', {
    callback = function()
      store()
    end
  })
end

return M
