return {
  "https://github.com/tpope/vim-fugitive",
  cmd = { "Git" },
  keys = {
    { "<leader>gs", ":Git<CR>", desc = "Git Status" },
    { "<leader>gd", ":Gdiffsplit<CR>", desc = "Git Diff" }
  }
}
