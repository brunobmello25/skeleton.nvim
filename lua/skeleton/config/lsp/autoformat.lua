local function create_commmand(props)
  vim.api.nvim_create_autocmd("BufWritePre", { command = props.command, buffer = props.bufnr })
end

local function eslint_config_exists()
  local eslint_files = vim.fn.glob('.eslintrc*')
  return eslint_files ~= ''
end

local M = {}

function M.setup(client, bufnr)
  local name = client.name

  if name == 'tailwindcss' then
    return
  end

  local is_eslint = name == 'eslint'
  local is_vtsls = name == 'vtsls'

  if is_eslint and not eslint_config_exists() then
    return
  end

  if is_vtsls and eslint_config_exists() then
    return
  end

  if is_eslint then
    create_commmand({ command = "EslintFixAll", bufnr = bufnr })
  else
    create_commmand({ command = "LspZeroFormat", bufnr = bufnr })
  end
end

return M
