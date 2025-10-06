-- lua/options.lua
-- Neovim UI and behavior settings
local opt = vim.opt

-- UI settings
opt.number = true            -- show line numbers
opt.relativenumber = true    -- relative line numbers
opt.signcolumn = "yes"       -- always show sign column (for diagnostics, git, etc.)
opt.cursorline = true        -- highlight current line
opt.termguicolors = true     -- enable 24-bit RGB colors

-- Indentation and formatting

opt.expandtab = true         -- use spaces instead of tabs
opt.shiftwidth = 4           -- indent size (4 spaces)
opt.tabstop = 4              -- tab equals 4 spaces
opt.smartindent = true       -- auto-indent new lines

-- Search settings
opt.ignorecase = true        -- case insensitive search...
opt.smartcase = true         -- ...unless query has capital
opt.hlsearch = true          -- highlight search matches
opt.incsearch = true         -- incremental search

-- Performance
opt.timeoutlen = 500         -- faster which-key menu (if used)
opt.updatetime = 300         -- faster CursorHold responsiveness

-- Splits
opt.splitbelow = true        -- open horizontal splits below
opt.splitright = true        -- open vertical splits to the right

-- Neovide GUI-specific settings (only apply when running in Neovide)
if vim.g.neovide then
  vim.g.neovide_normal_opacity = 0.4
  vim.g.neovide_padding_top = 10
  vim.g.neovide_padding_bottom = 10
  vim.g.neovide_padding_right = 10
  vim.g.neovide_padding_left = 10
-- vim.opt.clipboard = "unnamedplus"
  -- You can add other Neovide settings if desired (e.g., transparency, font, etc.)
end

