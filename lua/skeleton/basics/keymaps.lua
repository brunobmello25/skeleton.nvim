return {
  setup = function()
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

    vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines" })

    -- prevent yank when pasting from visual mode
    vim.keymap.set("x", "p", '"_dP', { desc = "Prevent yank when pasting" })

    -- sessionizer
    vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>", { desc = "Sessionizer" })

    vim.keymap.set("n", "<leader>w", "<C-w>", { desc = "Leader w" })

    -- source current file
    vim.keymap.set("n", "<leader><leader>x", function()
      -- save and source
      vim.cmd("w")
      vim.cmd("source %")
    end, { desc = "Source current file" })

    -- toggle wrap
    vim.keymap.set("n", "<leader>tw", "<cmd>set wrap!<CR>", { desc = "Toggle wrap" })

    vim.keymap.set("n", "<leader>m", "'", { desc = "mark navigation" })

    vim.keymap.set("n", "[q", "<cmd>cprevious<CR>", { desc = "Previous quickfix item" })
    vim.keymap.set("n", "]q", "<cmd>cnext<CR>", { desc = "Next quickfix item" })

    vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = "Scroll down" })
    vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = "Scroll up" })
  end,
}
