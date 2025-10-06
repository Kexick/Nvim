vim.g.mapleader = " "

require("options")
require("keymaps")

-- lazy.nvim bootstrap
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable",
    "https://github.com/folke/lazy.nvim.git", lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- load all plugin specs from lua/plugins/*
require("lazy").setup("plugins")

-- ui pieces
require("ui.colors")

-- utilities
require("utils.compiler")
require("utils.terminal")
require("utils.files")
