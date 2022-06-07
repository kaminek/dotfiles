-- Additional Plugins
lvim.plugins = {
  { "christoomey/vim-tmux-navigator" },

  -- colorschemas
  { "tiagovla/tokyodark.nvim" },
  { "marko-cerovac/material.nvim" },
  { "navarasu/onedark.nvim" },

  -- {
  --   "ray-x/lsp_signature.nvim",
  --   config = function()
  --     require("user/lsp_signature").config()
  --   end,
  --   event = "BufRead",
  -- },
  -- {
  --   "folke/trouble.nvim",
  --   config = function()
  --     require("trouble").setup {
  --       auto_open = true,
  --       auto_close = true,
  --       padding = false,
  --       height = 10,
  --       use_lsp_diagnostic_signs = true,
  --     }
  --   end,
  --   cmd = "Trouble",
  -- },
  -- {
  --   "lukas-reineke/indent-blankline.nvim",
  --   setup = function()
  --     vim.g.indent_blankline_char = "▏"
  --   end,
  --   config = function()
  --     require("user.indent_blankline").config()
  --   end,
  --   event = "BufRead",
  -- },
  --     {"folke/tokyonight.nvim"},
}

-- Include plugins custom config

-- telescope
-- require "config.telescope"
