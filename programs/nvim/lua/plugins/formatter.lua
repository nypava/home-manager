return {
  "jay-babu/mason-null-ls.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "williamboman/mason.nvim",
    "nvimtools/none-ls.nvim",
  },
  config = function ()
    require("mason-null-ls").setup({
      ensure_installed = { "black", "prettierd"}
    })

    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.prettierd.with({
          filetypes = {
            "javascript",
            "javascriptreact",
            "typescript",
            "typescriptreact", 
            "json",
            "css",
            "scss",
            "html",
          },
        }),
        null_ls.builtins.formatting.black,
      },
    })
  end

}
