return {
  {
    "backdround/global-note.nvim",
    config = function()
      local get_project_name = function()
        local project_directory, err = vim.loop.cwd()
        if project_directory == nil then
          vim.notify(err, vim.log.levels.WARN)
          return nil
        end

        local project_name = vim.fs.basename(project_directory)
        if project_name == nil then
          vim.notify("Unable to get the project name", vim.log.levels.WARN)
          return nil
        end

        return project_name
      end

      local global_note = require("global-note")

      global_note.setup({
        additional_presets = {
          project_local = {
            command_name = "ProjectNote",

            filename = function()
              return get_project_name() .. ".md"
            end,

            title = "Project note",
          },
        },
      })


      vim.keymap.set("n", "<leader>gn", global_note.toggle_note, {
        desc = "Toggle global note",
      })
      vim.keymap.set("n", "<leader>pn", function()
        global_note.toggle_note("project_local")
      end, {
        desc = "Toggle project note",
      })
    end
  }
}
