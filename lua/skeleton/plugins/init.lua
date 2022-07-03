local fs = require('skeleton.utils.fs')
local core = require('skeleton.core')

local M = {}

function M.setup(plugins)
    local install_path = fs.join_paths(vim.fn.stdpath("data"), "site", "pack", "packer", "start", "packer.nvim")
    local compile_path = fs.join_paths(vim.fn.stdpath("data"), "site", "pack", "packer", "start", "packer.nvim",
    "compiled", "packer_compiled.lua")
    local package_root = fs.join_paths(vim.fn.stdpath("data"), "site", "pack")

    local init_opts = {
        package_root = package_root,
        compile_path = compile_path,
        git = {
            clone_timeout = 300
        }
    }

    if not fs.is_directory(install_path) then
        vim.fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path})
        vim.cmd("packadd packer.nvim")
    end

    local status_ok, packer = pcall(require, "packer")

    if status_ok then
        packer.init(init_opts)
    end

    packer.reset()

    packer.startup(function(use)
        for _, p in pairs(plugins) do
            use(p)
        end
    end)

    local created, _ = core.cron_add("packer:sync", "1w")
    local to_update, _ = core.cron_update("packer:sync")
    if to_update or created then
      packer.sync()
    end
end

return M
