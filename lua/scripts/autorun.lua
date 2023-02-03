local function make_output_split()
  local original_bufnr = vim.api.nvim_get_current_buf()

  vim.cmd('vnew')

  local split_bufnr = vim.api.nvim_get_current_buf()
  -- set split buffer to readonly

  return original_bufnr, split_bufnr
end

local function attach_to_buffer(command, pattern)
  local original_bufnr, split_bufnr = make_output_split()

  local augroup = vim.api.nvim_create_augroup('AutoRun', { clear = true })

  local autocmd_id = vim.api.nvim_create_autocmd('BufWritePost', {
    pattern = pattern,
    group = augroup,
    callback = function()
      local handle_data = function(_, data)
        if data then
          vim.api.nvim_buf_set_lines(split_bufnr, -1, -1, false, data)
        end
      end

      vim.api.nvim_buf_set_lines(split_bufnr, 0, -1, false, { 'command output:' })
      vim.fn.jobstart(command, {
        stdout_buffered = true,
        on_stdout = handle_data,
        on_stderr = handle_data
      })
    end
  })

  vim.api.nvim_create_autocmd('BufUnload', {
    buffer = split_bufnr,
    callback = function()
      vim.api.nvim_del_autocmd({ id = autocmd_id })
      vim.api.nvim_buf_set_option(split_bufnr, 'modified', true)
      vim.api.nvim_buf_delete(split_bufnr, { force = true })
    end
  })
end

vim.api.nvim_create_user_command('AutoRun', function()
  local command = vim.split(vim.fn.input("Command: "), ' ')
  local pattern = vim.fn.input("Pattern: ")

  attach_to_buffer(command, pattern)
end, {})
