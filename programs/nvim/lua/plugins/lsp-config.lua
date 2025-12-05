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
          ensure_installed = {"lua_ls", "ruff", "rust_analyzer", "svelte", "tailwindcss","html", "cssls",  "unocss", "ts_ls", "jsonls", "nil_ls", "zls", "eslint", "pyright", "clangd"},
        }
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

      vim.lsp.config("ruff", {
        on_attach = function(client, bufnr)
          if client.name == 'ruff' then
            client.server_capabilities.hoverProvider = false
          end
        end
      })

      vim.lsp.config("pyright", {
        on_attach = function(client, bufnr)
          if client.name == 'pyright' then
            client.server_capabilities.documentFormattingProvider = false
            client.server_capabilities.documentRangeFormattingProvider = false
          end
        end
      })

      vim.lsp.config("clang", {
        cmd = { "clangd", "--background-index" },
        filetypes = { "c", "cpp" },
      })

      vim.lsp.enable("lua_ls")
      vim.lsp.enable("ruff")
      vim.lsp.enable("pyright")
      vim.lsp.enable("svelte")
      vim.lsp.enable("rust_analyzer")
      vim.lsp.enable("tailwindcss")
      vim.lsp.enable("html")
      vim.lsp.enable("cssls")
      vim.lsp.enable("ts_ls")
      vim.lsp.enable("eslint")
      vim.lsp.enable("unocss")
      vim.lsp.enable("jsonls")
      vim.lsp.enable("nil_ls")
      vim.lsp.enable("zls")
      vim.lsp.enable("setup")

      vim.keymap.set('n', '<leader>h', vim.lsp.buf.hover, {})
      vim.keymap.set('n', '<leader>r', vim.lsp.buf.references)

        end
      }
  }
