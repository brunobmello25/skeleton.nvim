return {
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      vim.cmd [[highlight IndentBlanklineIndent1 guifg=#30465d guibg=#14262b gui=nocombine]]
      vim.cmd [[highlight IndentBlanklineIndent2 guifg=#30465d guibg=#09262e gui=nocombine]]
      vim.cmd [[highlight IndentBlanklineIndent3 guifg=#30465d guibg=#161e37 gui=nocombine]]

      require("indent_blankline").setup {
        char = "▎",
        char_highlight_list = {
          "IndentBlanklineIndent1",
          "IndentBlanklineIndent2",
          "IndentBlanklineIndent3",
        },
        space_char_highlight_list = {
          "IndentBlanklineIndent1",
          "IndentBlanklineIndent2",
          "IndentBlanklineIndent3",
        },
        show_trailing_blankline_indent = false,
      }

      vim.api.nvim_create_user_command('ToggleRainbow', 'IndentBlanklineToggle', {})
    end,
    init = function()
      vim.g.indent_blankline_enabled = false
    end
  }
}
