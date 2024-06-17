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

    vim.opt.incsearch = true

    vim.opt.termguicolors = true

    vim.opt.mouse = "a"

    vim.opt.scrolloff = 8

    vim.opt.ignorecase = true
    vim.opt.smartcase = true

    vim.opt.splitbelow = true
    vim.opt.splitright = true

    vim.opt.updatetime = 50

    -- code folding
    vim.opt.foldenable = false
    vim.opt.foldlevel = 99
    vim.opt.fillchars = "fold: "
    vim.opt.foldmethod = "indent"

    vim.g.netrw_fastbrowse = 2

    vim.g.netrw_keepj = ""

    -- undo file
    vim.opt.undofile = true

    vim.o.timeoutlen = 200
  end,
}
