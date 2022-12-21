-- local fs = require('skeleton.utils.fs')
-- local core = require('skeleton.core')

local M = {}

function M.setup(plugins)
  -- Install packer
  local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
  local is_bootstrap = false

  if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    is_bootstrap = true
    vim.fn.system { 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path }
    vim.cmd [[packadd packer.nvim]]
  end

  -- local compile_path = fs.join_paths(vim.fn.stdpath("data"), "site", "pack", "packer", "start", "packer.nvim",
  --   "compiled", "packer_compiled.lua")
  -- local package_root = fs.join_paths(vim.fn.stdpath("data"), "site", "pack")

  -- local init_opts = {
  --   package_root = package_root,
  --   compile_path = compile_path,
  --   git = {
  --     clone_timeout = 300
  --   }
  -- }


  -- local status_ok, packer = pcall(require, "packer")
  --
  -- if status_ok then
  --   packer.init(init_opts)
  -- end

  require('packer').startup(function(use)
    for _, p in pairs(plugins) do
      use(p)
    end

    if is_bootstrap then
      require('packer').sync()
    end
  end)

  if is_bootstrap then
    print '=================================='
    print '    Plugins are being installed'
    print '    Wait until Packer completes,'
    print '       then restart nvim'
    print '=================================='
  end

  return is_bootstrap
end

return M
