local M = { init = false }

local status = ''
local setup = function()
  local api = require('copilot.api')
  api.register_status_notification_handler(function(data)
    -- customize your message however you want
    if data.status == 'Normal' then
      status = 'Ready'
    elseif data.status == 'InProgress' then
      status = 'Pending'
    else
      status = data.status or 'Offline' -- might never actually be nil but just in case
    end
    status = 'Copilot: ' .. status
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

