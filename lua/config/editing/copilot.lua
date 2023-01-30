return {
  init = function()
    vim.g.copilot_no_tab_map = true

    vim.keymap.set('i', '<C-u>', 'copilot#Accept("<CR>")')
  end
}
