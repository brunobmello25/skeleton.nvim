local M = {
  window_id = nil
}

-- TODO: finish this ranger floating window implementation

function M.toggle_ranger_floating()
  local width = math.floor(vim.api.nvim_get_option("columns") * 0.9)
  local height = math.floor(vim.api.nvim_get_option("lines") * 0.9)

  local buf = vim.api.nvim_create_buf(false, true)

  local col = 10 -- horizontal position
  local row = 5  -- vertical position

  local opts = {
    style = "minimal",
    relative = "editor",
    width = width,
    height = height,
    col = col,
    row = row,
    border = "rounded"
  }

  M.window_id = vim.api.nvim_open_win(buf, true, opts)

  vim.cmd("Ranger")
end

return {
  {
    "francoiscabrol/ranger.vim",
    dependencies = {
      "rbgrouleff/bclose.vim",
    },
    init = function()
      vim.g.ranger_map_keys = 0
    end,
    config = function()
      vim.keymap.set("n", "<leader>e", "<cmd>Ranger<cr>", { desc = "Open ranger" })
      -- vim.keymap.set("n", "<leader>e", function()
      --   M.toggle_ranger_floating()
      -- end, { desc = "Open ranger" })
    end,
  },
}
