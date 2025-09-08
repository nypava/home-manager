return {
  "brenton-leighton/multiple-cursors.nvim",
  version = "*",  -- Use the latest tagged version
  opts = {},  -- This causes the plugin setup function to be called
  keys = {
    {"<s-C-j>", "<Cmd>MultipleCursorsAddDown<CR>", mode = {"n", "i"}},
    {"<s-C-k>", "<Cmd>MultipleCursorsAddUp<CR>", mode = {"n", "i"}},
  },
}
