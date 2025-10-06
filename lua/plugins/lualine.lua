return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = function()
    local function keyboard_layout()
      local out = vim.fn.system("xkb-switch -p")
      out = (out or ""):gsub("%s+$","")
      if out == "" then return "" end
      return " " .. out
    end
    return {
      options = {
        theme = "auto",
        globalstatus = true,
        component_separators = { left = "", right = "" },
        section_separators   = { left = "", right = "" },
        disabled_filetypes = { statusline = { "dashboard", "alpha" } },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { "filename" },
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "progress", "location" },
        lualine_z = {
          keyboard_layout,
          { function() return os.date("%H:%M %d %b") end, icon = "" },
        },
      },
    }
  end
}
