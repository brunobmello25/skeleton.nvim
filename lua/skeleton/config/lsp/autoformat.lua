local function create_commmand(props)
  vim.api.nvim_create_autocmd("BufWritePre", { command = props.command, buffer = props.bufnr })
end

local function eslint_config_exists()
  -- search for eslint files: .eslintrc.js, .eslintrc.json, .eslintrc.yaml, .eslintrc.yml, .eslintrc
  local eslint_files = vim.fn.glob('.eslintrc*')
  return eslint_files ~= ''
end

local M = {}

function M.setup(client, bufnr)
  -- local name = client.name
  -- local skip_format_autocmd = name == 'eslint' or name == 'vtsls' or name == 'tsserver' or name == 'tailwindcss'
  --
  -- if name == 'eslint' then
  --   create_commmand({ command = "EslintFixAll", bufnr = bufnr })
  -- elseif not skip_format_autocmd then
  --   create_commmand({ command = "LspZeroFormat", bufnr = bufnr })
  -- end

  local name = client.name

  if name == 'tailwindcss' then
    return
  end

  local is_eslint = name == 'eslint'
  local is_vtsls = name == 'vtsls'

  if is_eslint and eslint_config_exists() then
    create_commmand({ command = "EslintFixAll", bufnr = bufnr })
    return
  end

  if is_vtsls and not eslint_config_exists() then
    create_commmand({ command = "LspZeroFormat", bufnr = bufnr })
    return
  end

  create_commmand({ command = "LspZeroFormat", bufnr = bufnr })
end

return M
