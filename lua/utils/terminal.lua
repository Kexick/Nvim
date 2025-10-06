-- Fixed-size bottom terminal and 'term here' command
vim.api.nvim_create_user_command("FixedTerminal", function(opts)
  local height = tonumber(opts.args) or 12
  vim.cmd(string.format("%dsplit | terminal", height))
  vim.cmd("startinsert")
end, { nargs = "?" })

vim.api.nvim_create_user_command("TermHere", function(opts)
  local h = tonumber(opts.args) or 10
  local dir = vim.fn.expand("%:p:h")
  if dir == "" then dir = vim.fn.getcwd() end
  vim.cmd(("lcd %s | botright %dsplit | terminal"):format(vim.fn.fnameescape(dir), h))
  vim.cmd("setlocal winfixheight")
  vim.cmd("startinsert")
end, { nargs = "?" })
