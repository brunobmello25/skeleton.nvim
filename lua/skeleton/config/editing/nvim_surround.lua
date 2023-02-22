local M = {}


function M.config()
  require("nvim-surround").setup({
    keymaps = {
      insert = false,
      insert_line = false,
      normal = false,
      normal_cur = false,
      normal_line = false,
      normal_cur_line = false,
      visual = false,
      visual_line = false,
      delete = "ds",
      change = "cs",
    },
  })
end

return M
