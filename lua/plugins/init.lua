-- Loader that gathers all plugin spec files in this directory
local M = {}

-- Return a list of specs (each file returns a spec or list of specs)
M[1] = require("plugins.dashboard")
M[#M+1] = require("plugins.lualine")
M[#M+1] = require("plugins.telescope")
M[#M+1] = require("plugins.treesitter")
M[#M+1] = require("plugins.git")
M[#M+1] = require("plugins.markdown")
M[#M+1] = require("plugins.session")
M[#M+1] = require("plugins.lsp")
M[#M+1] = require("plugins.nvimtree")
M[#M+1] = require("plugins.ui_select")

return M
