return {
  setup = function()
    require('keep-it-secret').setup()

    -- TODO: fix this
    -- vim.api.nvim_add_user_command('ToggleKeepItSecret', ":lua require('keep-it-secret').toggle()")
  end
}
