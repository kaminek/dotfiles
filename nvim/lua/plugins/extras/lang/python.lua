return {
  -- Add Python tools to mason
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "pyrefly",
        "black",
        "ruff",
      })
    end,
  },

  -- Disable other Python LSPs in favor of pyrefly
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        basedpyright = { enabled = false },
        pyright = { enabled = false },
        jedi_language_server = { enabled = false },
        -- Pyrefly as main Python LSP (type checking + completions)
        pyrefly = {},
        -- Keep ruff for linting + organize imports
        ruff = {},
      },
    },
  },

  -- Setup up format with conform.nvim
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        ["python"] = { "ruff_format", "black" },
      },
    },
  },
}
