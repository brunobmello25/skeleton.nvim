local fs = require("skeleton.utils.fs")
local srl = require("skeleton.utils.serialize")

local M = {}

local cron_file_path = fs.join_paths(vim.fn.stdpath("config"), "lua", "skeleton", "cron_core.tbl")

local function _get_cron_table()
  local file_data = fs.read_file(cron_file_path)

  local tbl = {}
  if file_data ~= "" then
    tbl = srl.deserialize_table(file_data)
  end

  return tbl
end

local function _save_cron_table(tbl)
  local tbl_data = srl.serialize_table(tbl)
  fs.save_file(cron_file_path, tbl_data)
end

function M.cron_update(key)
  local cron = _get_cron_table()

  if not cron[key] then
    return false, nil
  end

  local now = os.time(os.date("!*t"))

  -- if today didn't pass the next_update
  if os.difftime(now, cron[key].next_update) < 0 then
    return false, cron[key]
  end

  local sec_to_add = cron[key].recurrence_in_sec

  cron[key] = {
    next_update = now + sec_to_add,
    last_update = now,
    created_at = cron[key].created_at,
    recurrence = cron[key].recurrence,
    recurrence_in_sec = cron[key].recurrence_in_sec,
  }

  _save_cron_table(cron)

  return true, cron[key]
end

function M.cron_add(key, recurrence)
  local cron = _get_cron_table()

  if cron[key] then
    return false, cron[key]
  end

  local now = os.time(os.date("!*t"))
  local week_in_sec = 7 * 24 * 60 * 60

  cron[key] = {
    next_update = now + week_in_sec,
    last_update = now,
    created_at = now,
    recurrence = "1w",
    recurrence_in_sec = week_in_sec,
  }

  _save_cron_table(cron)

  return true, cron[key]
end

return M
