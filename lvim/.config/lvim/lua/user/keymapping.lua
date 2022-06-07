lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<S-tab>"] = ":bprevious<CR>"
lvim.keys.normal_mode["<tab>"] = ":bnext<CR>"

-- Whichkey

-- Use which-key to add extra bindings with the leader-key prefix
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["t"] = {
  name = "+Trouble",
  d = { "<cmd>Trouble lsp_document_diagnostics<cr>", "Diagnosticss" },
  f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
  l = { "<cmd>Trouble loclist<cr>", "LocationList" },
  q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
  r = { "<cmd>Trouble lsp_references<cr>", "References" },
  t = { "<cmd>TodoLocList <cr>", "Todo" },
  w = { "<cmd>Trouble lsp_workspace_diagnostics<cr>", "Diagnosticss" },
}
