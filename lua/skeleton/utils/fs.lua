local uv = vim.loop

local M = {}

function M.join_paths(...)
  local res = table.concat({ ... }, "/")
  return res
end

function M.is_file(path)
  local stat = uv.fs_stat(path)
  return stat and stat.type == "file" or false
end

function M.is_directory(path)
  local stat = uv.fs_stat(path)
  return stat and stat.type == "directory" or false
end

function M.read_file(path)
  local stat = uv.fs_stat(path)
  local fd = nil
  local size = 0

  if not stat then
    fd = uv.fs_open(path, "w", 420)
  else
    fd = uv.fs_open(path, "r", 0)
    size = stat.size
  end

  local str = uv.fs_read(fd, size)
  uv.fs_close(fd)

  if str == nil then
    return ""
  else
    return str
  end
end

function M.save_file(path, data)
  local fd = uv.fs_open(path, "w", 420)
  local bytes = uv.fs_write(fd, data)
  uv.fs_close(fd)

  return bytes
end

return M
