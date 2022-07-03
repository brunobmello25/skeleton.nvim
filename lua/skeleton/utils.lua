local uv = vim.loop

local M = {}

function M.join_paths(...)
    local res = table.concat({...}, "/")
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

return M
