local M = {}

M._init = false
M._status = ''

M._setup = function()
  M._init = true

  local api = require('copilot.api')
  local lualine = require('lualine')

  api.register_status_notification_handler(function(data)
    -- customize your message however you want
    if data.status == 'Normal' then
      M._status = 'Idle'
    elseif data.status == 'InProgress' then
      M._status = 'Loading'
    else
      if data.status ~= '' then
        M._status = data.status -- might never actually be nil but just in case
      else
        M._status = 'Offline'
      end
    end
    M._status = 'Copilot: ' .. M._status

    lualine.refresh()
  end)
end

M.get_status = function()
  if not M._init then
    M._setup()
  end
  return M._status
end

return M
