local M = {}

M.is_bootstrap = false

function M.setup(plugins)
  -- Install packer
  local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

  if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    M.is_bootstrap = true
    vim.fn.system { 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path }
    vim.cmd [[packadd packer.nvim]]
  end

  local packer = require('packer')

  packer.init()
  packer.reset()

  packer.startup(function(use)
    for _, p in pairs(plugins) do
      use(p)
    end

    if M.is_bootstrap then
      require('packer').sync()
    end
  end)
end

function M.print_bootstrap_warn_message()
  print '=================================='
  print '    Plugins are being installed'
  print '    Wait until Packer completes,'
  print '       then restart nvim.'
  print '  if any plugin fails to install'
  print '   run :PackerSync in nvim again'
  print '=================================='
end

return M
