return {
  setup = function(client, _)
    local name = client.name
    local skip_format_autocmd = name == 'eslint' or name == 'vtsls' or name == 'tsserver'

    if not skip_format_autocmd then
      local group = vim.api.nvim_create_augroup("LspFormatOnSave", { clear = true })

      vim.api.nvim_create_autocmd("BufWritePre", { command = "LspZeroFormat", group = group })
    end

    if name == 'eslint' then
      local group = vim.api.nvim_create_augroup('EslintFormatOnSave', { clear = true })

      vim.api.nvim_create_autocmd('BufWritePre', { command = 'EslintFixAll', group = group })
    end
  end
}
