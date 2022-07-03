local utils = require("skeleton.utils")

local M = {}

function M.setup(plugins)
    local install_path = utils.join_paths(vim.fn.stdpath("data"), "site", "pack", "packer", "start", "packer.nvim")
    local package_root = utils.join_paths(vim.fn.stdpath("data"), "site", "pack")

    local init_opts = {
        package_root = package_root,
        git = {
            clone_timeout = 300
        }
    }

    if not utils.is_directory(install_path) then
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

    packer.sync()
end

return M
