return {
  "stevearc/conform.nvim",
  keys = {
    { "<leader>cc", "<cmd>ConformInfo<cr>", desc = "Conform Info" },
  },
  opts = {
    -- Map of filetype to formatters
    formatters_by_ft = {
      json = { "dprint", "prettierd", "prettier", stop_after_first = true },
      jsonc = { "dprint", "prettierd", "prettier", stop_after_first = true },
      markdown = { "dprint" },
      sql = { "dprint" },
      toml = { "dprint" },
      yaml = { "dprint" },
      -- python config moved to plugins/extras/lang/python.lua
    },
    -- Custom formatters and changes to built-in formatters
    formatters = {
      shfmt = {
        -- The base args are { "-filename", "$FILENAME" } so the final args will be
        -- { "-i", "2", "-filename", "$FILENAME" }
        prepend_args = { "-s", "-i", "2", "-bn", "-ci" },
      },
    },
  },
}
