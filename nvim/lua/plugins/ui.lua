return {
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        always_show_bufferline = true,
        separator_style = "thin",
      },
    },
  },
  {
    "akinsho/git-conflict.nvim",
    event = "VeryLazy",
    config = true,
  },

  {
    "lukas-reineke/virt-column.nvim",
    event = "VeryLazy",
    config = function()
      require("virt-column").setup({ char = "▕" })
    end,
  },

  -- {
  --   "utilyre/barbecue.nvim",
  --   dev = true,
  --   event = "VeryLazy",
  --   dependencies = {
  --     "SmiteshP/nvim-navic",
  --     "nvim-tree/nvim-web-devicons",
  --   },
  -- },

  "folke/twilight.nvim",
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    opts = {
      window = { backdrop = 0.7 },
      plugins = {
        gitsigns = true,
        tmux = true,
        kitty = { enabled = false, font = "+2" },
      },
    },
    keys = { { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" } },
  },
}
