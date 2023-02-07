local M = {}

M.config = function()
  local status_ok, gitlinker = pcall(require, "gitlinker")
  if not status_ok then
    return
  end

  gitlinker.setup {
    -- default mapping to call url generation with action_callback
    mappings = "<leader>gy",
  }
end

return M
