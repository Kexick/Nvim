-- C compiler: use :make with gcc flags and gcc errorformat
vim.api.nvim_create_autocmd("FileType", {
  pattern = "c",
  callback = function()
    vim.cmd("compiler gcc")
    vim.bo.makeprg = "gcc -std=c11 -Wall -Wextra -Werror % -o %<"
  end,
})
