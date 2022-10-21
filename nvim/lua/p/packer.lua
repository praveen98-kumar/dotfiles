local fn = vim.fn
local install_path = fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local compile_path = install_path .. '/plugin/packer_compiled.lua'
local plugins = require 'p.plugins'

vim.api.nvim_set_hl(0, 'NormalFloat', { bg = nil })
local ensure_packer = function()
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system { 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path }
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

local ok, packer = pcall(require, 'packer')

if not ok then
  print 'Packer is not installed'
  return
end

packer.init {
  compile_path = compile_path,
  compile_on_sync = true,
  auto_clean = true,
  display = {
    open_fn = function()
      return require('packer.util').float { border = 'rounded' }
    end,
  },
}

return packer.startup(function(use)
  for k, v in pairs(plugins) do
    plugins[k][1] = k
    use(v)
  end
  if packer_bootstrap then
    packer.sync()
  end
end)
