return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup(
        {
          ensure_installed = {"lua_ls", "pyright", "biome", "rust_analyzer", "svelte", "tailwindcss", "clangd", "html", "cssls",  "unocss", "ts_ls", "jsonls", "nil" } }
      )
    end,
  },
  {
    "neovim/nvim-lspconfig",

    config = function()
      vim.diagnostic.config({
        virtual_text = true,
        signs = false,
        underline = true,
        update_in_insert = true,
        severity_sort = false,
      })

      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({})
      lspconfig.pyright.setup({file_type={"python"}})
      lspconfig.biome.setup({})
      lspconfig.svelte.setup({file_type="svelte"})
      lspconfig.rust_analyzer.setup({})
      lspconfig.tailwindcss.setup({file_type={"svelte"}})
      lspconfig.clangd.setup({})
      lspconfig.html.setup({file_type={"html"}})
      lspconfig.cssls.setup({})
      lspconfig.ts_ls.setup({})
      lspconfig.unocss.setup({})
      lspconfig.jsonls.setup({})
      -- lspconfig.nil.setup({})

      lspconfig.dartls.setup({
        filetypes = { "dart" },
        root_dir = function(fname)
          return lspconfig.util.root_pattern("pubspec.yaml")(fname)
            or vim.fn.getcwd()
        end,
      })

      vim.keymap.set('n', '<leader>h', vim.lsp.buf.hover, {})
      vim.keymap.set('n', '<leader>r', vim.lsp.buf.references)

    end
  }
}
