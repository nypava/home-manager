return {
  'neovim/nvim-lspconfig',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  'hrsh7th/cmp-vsnip',
  'hrsh7th/vim-vsnip',
  {
    "hrsh7th/nvim-cmp",
    commit = "b356f2c",
    pin = true,
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

      capabilities.textDocument.completion.completionItem.snippetSupport = true

      require('lspconfig').html.setup {
        capabilities = capabilities,
      }

      require('lspconfig').cssls.setup {
        capabilities = capabilities,
      }

      local cmp = require'cmp'

      cmp.setup.filetype("norg", {
        enabled = false,
      })

      cmp.setup({
        completion = {
          autocomplete = { cmp.TriggerEvent.TextChanged },
        },
        snippet = {
          expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
          end,
        },
        window = {
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<tab>'] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          {
            name = "nvim_lsp",
            keyword_length = 1,
            entry_filter = function(entry, ctx)
              return require("cmp").lsp.CompletionItemKind.Snippet ~= entry:get_kind()
            end,
          },
          { name = 'vsnip' },
        }, {
            { name = 'buffer' },
          })
      })
    end
  }
}
