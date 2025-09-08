vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.scrolloff = 6
vim.g.mapleader = ' '

vim.opt.termguicolors = true

vim.cmd("set expandtab")
vim.cmd("set backupcopy=yes")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set autoindent")
vim.cmd("set smartindent")
vim.opt.fillchars = {
  vert = " ",
  horiz = " ",
  fold = "⠀",
  eob = " ", -- suppress ~ at EndOfBuffer
  diff = "⣿", -- alternatives = ⣿ ░ ─ ╱
  msgsep = "‾",
  foldopen = "▾",
  foldsep = "│",
  foldclose = "▸",
}

vim.cmd("let g:vim_svelte_plugin_load_full_syntax = 1")
