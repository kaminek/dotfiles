-- disable automatic installation of servers
lvim.lsp.installer.setup.automatic_installation = false
-- check mason-tool-installer plugin

-- Configure formatters and linters manually
local linters = require "lvim.lsp.null-ls.linters"
local formatters = require "lvim.lsp.null-ls.formatters"

local linters_table = {
  {
    exe = "eslint_d",
    filetypes = {
      "javascript",
      "javascriptreact",
      "svelte",
      "typescript",
      "typescriptreact",
      "vue",
    },
  },
  {
    exe = "shellcheck",
    filetypes = {
      "sh",
      "shell",
      "bash",
      "zsh",
    },
  },
  {
    exe = "golangci_lint",
    filetypes = {
      "go",
    },
  },
  -- {
  --   exe = "stylelint",
  --   filetypes = {
  --     "css",
  --     "scss",
  --   },
  -- },
  {
    exe = "selene",
    filetypes = {
      "lua",
    },
  },
  {
    exe = "markdownlint",
    filetype = {
      "markdown",
    },
  },
  {
    exe = "flake8",
    filetype = {
      "python",
    },
  },
  {
    exe = "write-good",
    filetype = {
      "markdown",
    },
  },
  {
    exe = "tfsec",
    filetypes = {
      "terraform",
    },
  },
}

local formatters_table = {
  {
    exe = "gofumpt",
    filetypes = {
      "go",
    },
  },
  {
    exe = "stylua",
    filetypes = {
      "lua",
    },
  },
  {
    exe = "eslint_d",
    filetypes = {
      "javascript",
      "javascriptreact",
      "svelte",
      "typescript",
      "typescriptreact",
      "vue",
    },
  },
  {
    exe = "shfmt",
    filetypes = {
      "sh",
      "shell",
      "bash",
      "zsh",
    },
  },
  {
    exe = "black",
    args = { "--fast" },
    filetypes = {
      "python",
    },
  },
  {
    exe = "prettier",
    filetypes = {
      "html",
      "markdown",
      "yaml",
    },
  },
  {
    exe = "jq",
    filetypes = {
      "json",
    },
  },
  {
    exe = "terraform_fmt",
    filetypes = {
      "terraform",
    },
  },
}

formatters.setup(formatters_table)
linters.setup(linters_table)
