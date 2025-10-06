
return {
  "nvim-telescope/telescope-ui-select.nvim",
  dependencies = { "nvim-telescope/telescope.nvim" },
  event = "VeryLazy",  
  config = function()
    local telescope = require("telescope")

    telescope.setup({
      extensions = {
        ["ui-select"] = require("telescope.themes").get_dropdown({}),
      },
    })

    telescope.load_extension("ui-select")

    local orig_select = vim.ui.select
    vim.ui.select = function(items, opts, on_choice)
      local ok = pcall(require("telescope").extensions["ui-select"].select, items, opts, on_choice)
      if not ok then
        return orig_select(items, opts, on_choice)
      end
    end
  end,
}
