local M = {}

M.show_node_modules = true

return {
  {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("oil").setup({
        keymaps = {
          ["."] = "actions.parent",
          ["q"] = "actions.close",
        },
        view_options = {
          -- Show files and directories that start with "."
          show_hidden = true,
          -- This function defines what is considered a "hidden" file
          -- is_hidden_file = function(name, bufnr)
          --   return vim.startswith(name, ".")
          -- end,
          -- This function defines what will never be shown, even when `show_hidden` is set
          -- second argument is bufnr
          is_always_hidden = function(name, _)
            return name == "node_modules" and not M.show_node_modules
          end,
          sort = {
            -- sort order can be "asc" or "desc"
            -- see :help oil-columns to see which columns are sortable
            { "type", "asc" },
            { "name", "asc" },
          },
        },
      })

      -- create a user command "ShowNodeModules"
      -- vim.api.nvim_create_user_command("ToggleNodeModules", function()
      --   M.show_node_modules = not M.show_node_modules
      -- end, {})

      vim.keymap.set("n", "<leader>e", function()
        require("oil").toggle_float()
      end)
    end,
  },
}
