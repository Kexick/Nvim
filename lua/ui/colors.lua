-- colorscheme (pick one you like; keep "default" for now or install another theme plugin)
pcall(vim.cmd, "colorscheme default")

-- Dashboard highlights (from your nvf palette idea)
vim.api.nvim_set_hl(0, "DashboardHeader", { fg = "#ff0faf" })
vim.api.nvim_set_hl(0, "DashboardCenter", { fg = "#5fd7ff" })
vim.api.nvim_set_hl(0, "DashboardFooter", { fg = "#a8a8a8" })
vim.api.nvim_set_hl(0, "DashboardRed",    { fg = "#ff5f5f" })
vim.api.nvim_set_hl(0, "DashboardBlue",   { fg = "#5fd7ff" })
vim.api.nvim_set_hl(0, "DashboardGreen",  { fg = "#00ff87" })
vim.api.nvim_set_hl(0, "DashboardYellow", { fg = "#00ffff" })
vim.api.nvim_set_hl(0, "DashboardBlack",  { fg = "#ffffff" })

-- Indent guide highlight
vim.api.nvim_set_hl(0, "IndentGuide", { fg = "#00ff7f" })

-- выключаем indent-blankline на dashboard
vim.api.nvim_create_autocmd("FileType", {
  pattern = "dashboard",
  callback = function()
    pcall(function() require("ibl").setup_buffer(0, { enabled = false }) end)
    vim.opt_local.list = false       -- на всякий случай отключаем спец-символы
    vim.opt_local.colorcolumn = ""   -- убираем вертикальные колонки, если были
  end,
})
