local function make_output_split()
  local current_win = vim.api.nvim_get_current_win()

  vim.cmd('50vnew')

  local split_bufnr = vim.api.nvim_get_current_buf()

  vim.api.nvim_set_current_win(current_win)

  return split_bufnr
end

local function attach_to_buffer(command, pattern)
  local split_bufnr = make_output_split()

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

  vim.api.nvim_create_autocmd('WinClosed', {
    buffer = split_bufnr,
    group = augroup,
    callback = function()
      vim.cmd(split_bufnr .. "bd!")
      vim.api.nvim_del_autocmd(autocmd_id)
      return true -- delete the autocommand after
    end
  })
end

vim.api.nvim_create_user_command('AutoRun', function()
  local command = vim.split(vim.fn.input("Command: "), ' ')
  local pattern = vim.fn.input("Pattern: ")

  attach_to_buffer(command, pattern)
end, {})
