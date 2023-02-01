local function create_group_and_command(props)
  local group = vim.api.nvim_create_augroup(props.name, { clear = true })

  vim.api.nvim_create_autocmd("BufWritePre", { command = props.command, group = group })
end

return {
  setup = function(client, _)
    local name = client.name
    local skip_format_autocmd = name == 'eslint' or name == 'vtsls' or name == 'tsserver'

    if not skip_format_autocmd then
      create_group_and_command({ name = "LspFormatOnSave", command = "LspZeroFormat" })
    end

    if name == 'eslint' then
      create_group_and_command({ name = "EslintFormatOnSave", command = "EslintFixAll" })
    end
  end
}
