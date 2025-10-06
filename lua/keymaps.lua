-- lua/keymaps.lua
local map = vim.keymap.set
local default_opts = { noremap = true, silent = true }

-- Move selected lines up/down in Visual mode (J/K)
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected lines down", silent = true })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected lines up", silent = true })

-- Indent selected lines in Visual mode (H/L)
map("v", "H", "<gv", { desc = "Indent left" })
map("v", "L", ">gv", { desc = "Indent right" })

-- Window navigation (Ctrl + hjkl)
map("n", "<C-h>", "<C-w>h", { desc = "Focus left window", silent = true })
map("n", "<C-j>", "<C-w>j", { desc = "Focus window below", silent = true })
map("n", "<C-k>", "<C-w>k", { desc = "Focus window above", silent = true })
map("n", "<C-l>", "<C-w>l", { desc = "Focus right window", silent = true })

-- System clipboard copy/paste (leader y/p)
map("v", "<leader>y", "\"+y", { desc = "Yank to system clipboard" })
map("n", "<leader>p", "\"+p", { desc = "Paste from system clipboard" })

-- Convenience shortcuts
map("n", "<leader>n", ":nohlsearch<CR>", { desc = "Clear search highlight", silent = true })
map("n", "<leader>a", "ggVG", { desc = "Select all text", silent = true })
map("n", "<leader>w", ":w<CR>", { desc = "Save file", silent = true })
map("n", "<leader>x", ":x<CR>", { desc = "Save and quit", silent = true })
map("n", "<leader>q", ":q<CR>", { desc = "Quit window", silent = true })
map("n", "<leader>Q", ":q!<CR>", { desc = "Quit without saving", silent = true })

-- Sorting lines (visual mode)
map("x", "<leader>s", ":sort<CR>", { desc = "Sort lines alphabetically", silent = true })
map("x", "<leader>S", ":sort!<CR>", { desc = "Sort lines in reverse", silent = true })
map("x", "<leader>l", ":'<,'>!awk '{ print length, $0 }' | sort -n | cut -d\" \" -f2-<CR>", 
    { desc = "Sort lines by length", silent = true })
map("x", "<leader>L", ":'<,'>!awk '{ print length, $0 }' | sort -nr | cut -d\" \" -f2-<CR>", 
    { desc = "Sort lines by length (reverse)", silent = true })

-- Tab management
map("n", "<Tab>", ":tabnext<CR>", { desc = "Next tab" })
map("n", "<S-Tab>", ":tabprevious<CR>", { desc = "Previous tab" })  -- using Shift-Tab since <C-Tab> isn't default
map("n", "<leader><Tab>", ":tabnew<CR>", { desc = "New tab" })
map("n", "<leader>c", ":tabclose<CR>", { desc = "Close tab" })

-- EasyAlign plugin mapping (visual mode 'ga' to align by '=')
map("x", "ga", ":EasyAlign<CR>=", { desc = "Align selection on '='", silent = true })

-- Git shortcuts (requires fugitive and gitsigns)
map("n", "<leader>h", ":Gitsigns preview_hunk<CR>", { desc = "Preview Git hunk" })
map("n", "<leader>gd", ":Git add %<CR>", { desc = "Git add current file" })
map("n", "<leader>cf", ":Git commit %<CR>", { desc = "Git commit current file" })

-- Telescope file browser (find file)
map("n", "<leader>ff", ":Telescope file_browser<CR>", { desc = "Find file (file browser)" })

-- Window resizing with Alt + arrows
map("n", "<A-j>", ":resize -2<CR>", { desc = "Decrease window height", silent = true })
map("n", "<A-k>", ":resize +2<CR>", { desc = "Increase window height", silent = true })
map("n", "<A-h>", ":vertical resize +2<CR>", { desc = "Increase window width", silent = true })
map("n", "<A-l>", ":vertical resize -2<CR>", { desc = "Decrease window width", silent = true })

-- Terminal mode: exit to Normal with Esc
map("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode", silent = true })

-- Compile current C file (leader m triggers :make and open quickfix)
map("n", "<leader>m", ":make<CR>:cwindow<CR>", { desc = "Compile current C file", silent = true })


-- File tree
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "File tree", silent = true })
vim.keymap.set("n", "<leader>ef", ":NvimTreeFindFileToggle<CR>", { desc = "Find file", silent = true })

-- Fixed terminal
vim.keymap.set("n", "<leader>t", ":FixedTerminal<CR>", { desc = "Open terminal (fixed height)", silent = true })

vim.keymap.set("n", "<leader>r", function()
  require("utils.reload").reload_config()
end, { desc = "Reload config", silent = true })


-- Вставка из системного буфера:
vim.keymap.set("n", "<leader>P", '"+p', { desc = "Paste system clipboard" })
vim.keymap.set("i", "<C-v>", '<C-r>+', { desc = "Paste clipboard (insert)" })
vim.keymap.set("c", "<C-v>", '<C-r>+', { desc = "Paste clipboard (cmdline)" })
-- В терминале:
vim.keymap.set("t", "<C-v>", function()
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<C-\\><C-n>"+pi', true, false, true), 'n', true)
end, { desc = "Paste clipboard (terminal)", silent = true })
