local function create_commmand(props)
  vim.api.nvim_create_autocmd("BufWritePre", { command = props.command, buffer = props.bufnr })
end

local M = {}

function M.setup(client, bufnr)
  local name = client.name
  local skip_format_autocmd = name == 'eslint' or name == 'vtsls' or name == 'tsserver'

  if not skip_format_autocmd then
    create_commmand({ command = "LspZeroFormat", bufnr = bufnr })
  end

  if name == 'eslint' then
    create_commmand({ command = "EslintFixAll", bufnr = bufnr })
  end
end

return M
