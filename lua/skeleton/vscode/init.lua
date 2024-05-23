vim.g.mapleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- code folding
vim.opt.foldenable = false
vim.opt.foldlevel = 99
vim.opt.fillchars = "fold: "
vim.opt.foldmethod = "indent"

vim.keymap.set({ "n", "v" }, "<leader>y", '"+y<CR>', { desc = "Yank to clipboard" })
-- indent lines with tab and shift+tab in visual mode
vim.keymap.set("v", ">", ">gv", { desc = "Indent right" })
vim.keymap.set("v", "<", "<gv", { desc = "Indent left" })

-- copy relative path
vim.cmd("command! CopyRelPath call setreg('+', expand('%'))")

vim.keymap.set("n", "<leader>q", "<cmd>q<CR>", { desc = "Quit" })

-- move selected lines up and down with J and K
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected lines down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected lines up" })

vim.keymap.set("n", "J", "mzJ`zdmz", { desc = "Join lines" })

-- prevent yank when pasting from visual mode
vim.keymap.set("x", "p", '"_dP', { desc = "Prevent yank when pasting" })

vim.keymap.set("n", "<leader>w", "<C-w>", { desc = "Leader w" })

-- toggle wrap
vim.keymap.set("n", "<leader>tw", "<cmd>set wrap!<CR>", { desc = "Toggle wrap" })

vim.keymap.set("n", "<leader>m", "'", { desc = "mark navigation" })

vim.keymap.set('n', '<c-d>', '<c-d>zz', { desc = "scroll down" })
vim.keymap.set('n', '<c-u>', '<c-u>zz', { desc = "scroll up" })

require('lazy').setup({
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {
      modes = {
        search = {
          enabled = false
        },
      },
    },
    -- stylua: ignore
    keys = {
      { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
      { "S",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
      { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
      { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
    },
  }
})
