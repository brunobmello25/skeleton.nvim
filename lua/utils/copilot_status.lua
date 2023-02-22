local M = { init = false }

local status = ''
local setup = function()
  local api = require('copilot.api')
  local lualine = require('lualine')

  api.register_status_notification_handler(function(data)
    -- customize your message however you want
    if data.status == 'Normal' then
      status = 'Idle'
    elseif data.status == 'InProgress' then
      status = 'Loading'
    else
      status = data.status or 'Offline' -- might never actually be nil but just in case
    end
    status = 'Copilot: ' .. status

    lualine.refresh()
  end)
end

M.get_status = function()
  if not M.init then
    setup()
    M.init = true
  end
  return status
end

return M
