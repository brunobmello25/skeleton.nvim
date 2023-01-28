return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = { "c", "lua", "vim", "help", "javascript", "typescript", "tsx" },
        -- ensure_installed = 'all',
        highlight = {
          enable = true,
        },
        indent = {
          enable = true,
        },
      })
    end
  }
}
