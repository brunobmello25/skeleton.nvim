return {
  setup = function()
    vim.opt.number = true
    vim.opt.relativenumber = false

    vim.opt.tabstop = 2
    vim.opt.softtabstop = 2
    vim.opt.shiftwidth = 2
    vim.opt.expandtab = true
    vim.opt.smartindent = true

    vim.opt.wrap = false

    vim.opt.swapfile = false
    vim.opt.backup = false
    vim.opt.undodir = os.getenv("HOME") .. '/.vim/undodir'
    vim.opt.undofile = true

    vim.opt.incsearch = true

    vim.opt.termguicolors = true

    vim.opt.mouse = 'a'

    vim.opt.scrolloff = 8

    vim.opt.ignorecase = true

    vim.cmd('filetype plugin indent on')
    vim.cmd('set splitbelow splitright')

    vim.opt.updatetime = 50

    -- code folding
    vim.opt.foldenable = false
    vim.opt.foldlevel = 99
    vim.opt.fillchars = "fold: "
    vim.opt.foldmethod = "indent"
  end
}
