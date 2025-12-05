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
vim.cmd("set formatoptions-=o")

vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.cmd("set formatoptions-=o")
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    vim.lsp.enable("ruff")
    vim.lsp.enable("basedruff")
    if vim.bo.buftype == "nofile" then
      vim.api.nvim_buf_set_name(0, vim.fn.getcwd() .. "/__scratch__.py")
      vim.bo.buftype = ""
    end
  end,
})

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

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "typescriptreact", "javascriptreact" },
  callback = function()
    vim.bo.formatexpr = "v:lua vim.lsp.buf.format({ async = true })"
  end,
})

vim.cmd("let g:vim_svelte_plugin_load_full_syntax = 1")
