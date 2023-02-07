-- Additional Plugins
lvim.plugins = {
  { "christoomey/vim-tmux-navigator" },

  -- colorschemas
  { "tiagovla/tokyodark.nvim" },
  -- { "folke/tokyonight.nvim" },
  { "marko-cerovac/material.nvim" },
  { "navarasu/onedark.nvim" },
  { "lunarvim/synthwave84.nvim" },
  -- { "catppuccin/nvim", as = "catppuccin" },
  -- {
  --   "fgheng/winbar.nvim",
  --   config = function()
  --     require("user.winb").config()
  --   end,
  --   event = { "InsertEnter", "CursorMoved" },
  --   disable = lvim.builtin.winbar_provider ~= "treesitter",
  -- },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    config = function()
      require("user.mason-tool-installer").config()
    end,
  },
  {
    "ruifm/gitlinker.nvim",
    -- event = "BufRead",
    requires = "nvim-lua/plenary.nvim",
    -- config = function()
    --   require("user.gitlinker").config()
    -- end,
  },
  -- {
  --   "b0o/incline.nvim",
  --   config = function()
  --     require("user.incline").config()
  --   end,
  --   disable = lvim.builtin.winbar_provider ~= "filename",
  -- },

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
}

-- Include plugins custom config

-- telescope

-- require "config.telescope"
