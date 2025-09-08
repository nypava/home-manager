return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "nvim-telescope/telescope-live-grep-args.nvim" ,
    version = "^1.0.0"
  },
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {"lua", "javascript", "css", "python", "rust", "bash", "typescript", "svelte", "dart", "nix"},
      highlight = { enable = true,
      },
      indent = {
        enable = true,
      },
      autotag= {}
    })
  end
}
