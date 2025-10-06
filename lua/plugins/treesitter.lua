return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPost", "BufNewFile" },
  build = ":TSUpdate",
  opts = {
    ensure_installed = { "c","cpp","lua","vim","vimdoc","markdown","markdown_inline","nix","css","query" },
    highlight = { enable = true },
    indent = { enable = true },
    incremental_selection = { enable = true },
  }
}
