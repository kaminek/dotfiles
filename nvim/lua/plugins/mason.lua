return {
  {
    "mason-org/mason.nvim",
    opts = {
      ui = {
        border = "rounded",
      },
      ensure_installed = {
        "golangci-lint",
        "dprint",
        "stylua",
        "selene",
        "shellcheck",
        "shfmt",
        "tfsec",
      },
    },
  },
}
