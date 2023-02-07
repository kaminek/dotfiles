-- Neovim general
require("user.neovim").config() -- neovim related config

-- LunarVim general
lvim.log.level = "warn"
lvim.debug = false
lvim.format_on_save = true
lvim.colorscheme = "tokyonight-storm"
vim.g.catppuccin_flavour = "mocha"
-- lvim.colorscheme = "tokyodark"
lvim.leader = "space"
-- builtins core plugins
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"

-- lvim.builtin.notify.active = true

lvim.builtin.terminal.active = false

lvim.builtin.project.show_hidden = true

lvim.builtin.nvimtree.setup.view.side = "left"

lvim.builtin.treesitter.auto_install = true
lvim.builtin.treesitter.highlight.enabled = true
lvim.builtin.treesitter.ignore_install = {
  "haskell",
  "julia",
  "ledger",
  "ocaml",
  "ocaml_interface",
  "rst",
  "scala",
  "sparql",
  "supercollider",
  "swift",
  "teal",
  "turtle",
  "verilog",
  "zig",
}

lvim.builtin.alpha.dashboard.section.header.val = { "" }

-- winbar provider
lvim.builtin.winbar_provider = "treesitter"
