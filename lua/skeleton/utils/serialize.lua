local M = {}

function M.serialize_table(root)
  if type(root) ~= "table" then
    error("can only serialize tables, not " .. type(root) .. "s")
  end
  local tableToRef = {}
  local refToTable = {}
  local savecount = 0

  local ref = function(t)
    local ref = tableToRef[t]
    if not ref then
      table.insert(refToTable, t)
      ref = #refToTable
      tableToRef[t] = ref
    end

    return tableToRef[t]
  end

  local value = function(v)
    local vtype = type(v)
    if vtype == "string" then return string.format("%q", v)
    elseif vtype == "number" then return v
    elseif vtype == "boolean" then return tostring(v)
    elseif vtype == "table" then return "{" .. ref(v) .. "}"
    end
  end

  ref(root)
  local s = ""

  while #refToTable > savecount do
    savecount = savecount + 1
    local t = refToTable[savecount]
    s = s .. "{\n"
    for i, v in pairs(t) do
      s = string.format("%s[%s]=%s,\n", s, value(i), value(v))
    end
    s = s .. "},\n"
  end

  return string.format("{%s}", s)
end

function M.deserialize_table(s)
  if type(s) ~= "string" then
    error("can't unpickle a " .. type(s) .. ", only strings")
  end

  local gentables, err = load("return " .. s, "core._deserialize", "t")
  if not gentables then
    return err
  end

  local tables = gentables()

  for tnum = 1, #tables do
    local t = tables[tnum]
    local tcopy = {};
    for i, v in pairs(t) do tcopy[i] = v end
    for i, v in pairs(tcopy) do
      local ni, nv
      if type(i) == "table" then ni = tables[ i[1] ] else ni = i end
      if type(v) == "table" then nv = tables[ v[1] ] else nv = v end
      t[i] = nil
      t[ni] = nv
    end
  end

  return tables[1]
end

return M
