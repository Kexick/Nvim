return {
  "Shatur/neovim-session-manager",
  cmd = "SessionManager",
  config = function()
    local sm = require("session_manager")
    local cfg = require("session_manager.config")
    sm.setup({
      autoload_mode = cfg.AutoloadMode.Disabled,
      autosave_last_session = false,
      autosave_ignore_not_normal = true,
      autosave_only_in_session = false,
    })
  end,
}
