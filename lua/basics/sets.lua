return {
  setup = function()
    vim.opt.tabstop = 2
    vim.opt.mouse = 'a'
    vim.opt.expandtab = true
    vim.opt.number = true
    vim.opt.relativenumber = true
    vim.opt.shiftwidth = 2
    vim.opt.scrolloff = 8
    vim.opt.wrap = false
    vim.opt.ignorecase = true
    vim.cmd('filetype plugin indent on')
    vim.cmd('set splitbelow splitright')
    vim.opt.incsearch = true

    -- code folding
    vim.opt.foldenable = false
    vim.opt.foldlevel = 99
    vim.opt.fillchars = "fold: "
    vim.opt.foldmethod = "indent"
  end
}
