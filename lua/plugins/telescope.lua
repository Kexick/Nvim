return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  version = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
    "nvim-telescope/telescope-ui-select.nvim",
  },
  config = function()
    local telescope = require("telescope")

    telescope.setup({
      defaults = {
        mappings = {
          i = {
            ["<C-j>"] = "move_selection_next",
            ["<C-k>"] = "move_selection_previous",
          },
        },
      },
      extensions = {
        file_browser = {
          hijack_netrw = true,
          theme = "ivy",
        },
        ["ui-select"] = require("telescope.themes").get_dropdown({}),
      },
    })

    -- Подключаем расширения
    telescope.load_extension("file_browser")
    telescope.load_extension("ui-select")
  end,
}
