local term_buf -- запомнить терминал
function ToggleTerm()
  if term_buf and vim.api.nvim_buf_is_valid(term_buf) then
    local wins = vim.api.nvim_list_wins()
    for _, w in ipairs(wins) do
      if vim.api.nvim_win_get_buf(w) == term_buf then
        vim.api.nvim_win_close(w, true)
        return
      end
    end
  end
  vim.cmd("botright 12split | terminal")
  term_buf = vim.api.nvim_get_current_buf()
end
vim.keymap.set("n", "<leader>t", ToggleTerm, { desc = "Toggle terminal" })
