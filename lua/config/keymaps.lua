vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>")
vim.keymap.set("v", "<A-l>", ":'<,'>!awk '{ print length, $0 }' | sort -n | cut -d' ' -f2-<CR>", { noremap = true, silent = true })
vim.keymap.set("v", "<A-s>", ":'<,'>!sort")

