return {
  "nvim-tree/nvim-tree.lua",
  cmd = { "NvimTreeToggle", "NvimTreeOpen" },
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    view = { width = 36, side = "left" },
    renderer = { highlight_git = true, indent_markers = { enable = true } },
    filters = { dotfiles = false },
    git = { enable = true },
  }
}
