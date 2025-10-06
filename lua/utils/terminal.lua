
local term = { win = nil, buf = nil }

function _G.TermToggle(height)
  height = tonumber(height) or 12

  if term.win and vim.api.nvim_win_is_valid(term.win) then
    vim.api.nvim_win_close(term.win, true)
    term.win = nil
    return
  end

  local dir = vim.fn.expand("%:p:h")
  if dir == "" then dir = vim.fn.getcwd() end
  vim.cmd(("lcd %s"):format(vim.fn.fnameescape(dir)))

  if term.buf and vim.api.nvim_buf_is_valid(term.buf) then
    vim.cmd(("botright %dsplit"):format(height))
    vim.api.nvim_win_set_buf(0, term.buf)
  else
    vim.cmd(("botright %dsplit | terminal"):format(height))
    term.buf = vim.api.nvim_get_current_buf()
  end

  vim.cmd("setlocal winfixheight")
  vim.cmd("startinsert")
  term.win = vim.api.nvim_get_current_win()
end

vim.keymap.set("n", "<leader>t", function() TermToggle(12) end,
  { desc = "Toggle terminal (in file dir, fixed height)", silent = true })

