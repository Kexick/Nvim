local M = {}

function M.reload_config()
  for name, _ in pairs(package.loaded) do
    if name:match("^user") or name:match("^plugins") or name:match("^ui") or name:match("^utils") then
      package.loaded[name] = nil
    end
  end

  dofile(vim.fn.stdpath("config") .. "/init.lua")
  vim.notify("✅ Config reloaded!", vim.log.levels.INFO)
end

return M
