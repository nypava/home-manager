---@diagnostic disable: undefined-global
require("config")

vim.opt.termguicolors = true

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

vim.api.nvim_create_user_command('ToggleExplore', function()
  local bufname = vim.api.nvim_buf_get_name(0)
  local filetype = vim.bo.filetype
  if filetype == 'netrw' then
    vim.cmd('bd')
  else
    vim.cmd('Explore')  -- open netrw
  end
end, {})

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")
require("keymap")
