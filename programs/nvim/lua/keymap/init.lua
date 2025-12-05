local keymap = vim.keymap

keymap.set("v", " ", "<C-C>")
-- keymap.set('n', '<leader>b', ':Neotree filesystem reveal left <CR>')
-- keymap.set('n', '<leader>b', ':NvimTreeToggle <CR>')
keymap.set('n', '<leader>b', ':ToggleExplore<CR>', { noremap = true, silent = true })

keymap.set({'v', 'n'}, '<A-p>', '"+p')
keymap.set({'v', 'n'}, '<A-y>', '"+y')
keymap.set({'v', 'n'}, '<A-d>', 'd')

vim.keymap.set("n", "<C-N>", vim.diagnostic.goto_next)
vim.keymap.set("n", "<C-B>", vim.diagnostic.goto_prev)

keymap.set('n', '<CR>', '<nop>')

keymap.set("i", "jk", "<C-C>")

keymap.set('n', 'd', '"_d')
keymap.set('n', 'x', '"_x')

keymap.set('n', '<C-D>', '<C-D>M')
keymap.set('n', '<C-U>', '<C-U>M')

keymap.set({'v', 'n'}, '<C-k>', '{')
keymap.set({'v', 'n'}, '<C-j>', '}')
keymap.set({'v', 'n'}, '<leader>q', ':q! <CR>')
keymap.set({'v', 'n'}, '<leader>wq', ':wq <CR>')
keymap.set({'v', 'n'}, '<leader>w', ':w! <CR>')
keymap.set({'v', 'n'}, '<C-c>', ':noh <CR>')
keymap.set({'v', 'n'}, '<leader>rr', ':LspRestart <CR>')
keymap.set({'v', 'n'}, '<S-Tab>', ':bn <CR>')
keymap.set({'v', 'n'}, '<Tab>', ':bp <CR>')
keymap.set({'v', 'n'}, '<leader>t', ':b#<CR>')

keymap.set({'v', 'n'}, '+', 'A')

keymap.set({'v', 'n'}, "<leader>d", ":r! date <CR>")

keymap.set("n", "<C-l>", "<cmd>vertical resize +5<CR>")
keymap.set("n", "<C-h>", ":vertical resize -5<CR>")
keymap.set("n", "<A-k>", ":horizontal resize +2<CR>")
keymap.set("n", "<A-j>", ":horizontal resize -2<CR>")

keymap.set('n', '<leader>na', function()
  vim.opt.number = true
  vim.opt.relativenumber = false
end)

keymap.set('n', '<leader>nr', function()
  vim.opt.relativenumber = true
end)

vim.keymap.set({'v', 'n'}, "<leader>g", ":lua vim.lsp.buf.format({ async = true })<CR>")

keymap.set("i", "<Space>", "<Space><C-g>u")
keymap.set("i", ".", ".<C-g>u")
keymap.set("i", ",", ",<C-g>u")
keymap.set("i", "!", "!<C-g>u")
keymap.set("i", "?", "?<C-g>u")
keymap.set("i", ";", ";<C-g>u")
keymap.set("i", ":", ":<C-g>u")
