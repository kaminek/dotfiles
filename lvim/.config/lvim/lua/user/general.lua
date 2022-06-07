-- general

lvim.log.level = "warn"
lvim.debug = false
lvim.format_on_save = true
lvim.colorscheme = "onedarker"
-- lvim.colorscheme = "tokyodark"
vim.opt.wrap = true
vim.opt.spell = false

lvim.leader = "space"

-- builtins
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = false
lvim.builtin.project.show_hidden = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0
lvim.builtin.treesitter.highlight.enabled = true
-- lvim.builtin.treesitter.ensure_installed = "maintained"
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

-- tokyodark
vim.g.tokyodark_transparent_background = false
vim.g.tokyodark_enable_italic_comment = true
vim.g.tokyodark_enable_italic = true
vim.g.tokyodark_color_gamma = "1.0"

-- material
vim.g.material_style = "deep ocean"

-- vim.g.onedarker_config.style = "darker"
