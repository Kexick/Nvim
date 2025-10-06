-- helper used by dashboard "New file" action via Telescope file_browser
function _G.create_new_file_with_browser()
  -- lazy-load telescope if needed
  pcall(function() require("lazy").load({ plugins = { "telescope.nvim", "telescope-file-browser.nvim" } }) end)
  local has_telescope, telescope = pcall(require, "telescope")
  if not has_telescope then
    vim.cmd("enew") ; return
  end
  telescope.load_extension("file_browser")
  local fb = telescope.extensions.file_browser
  local action_state = require("telescope.actions.state")
  local actions = require("telescope.actions")
  fb.file_browser({
    prompt_title = "New File",
    path = vim.fn.expand("%:p:h"),
    select_buffer = true,
    attach_mappings = function(prompt_bufnr, map)
      local function enter()
        local entry = action_state.get_selected_entry()
        actions.close(prompt_bufnr)
        vim.ui.input({ prompt = "Filename: " }, function(input)
          if input and input ~= "" then
            local new_path = entry[1] .. "/" .. input
            vim.cmd("edit " .. vim.fn.fnameescape(new_path))
          end
        end)
      end
      map("i", "<CR>", enter)
      map("n", "<CR>", enter)
      return true
    end
  })
end
