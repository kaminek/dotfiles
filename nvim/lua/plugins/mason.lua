return {
  {
    "mason-org/mason.nvim",
    opts = {
      ui = {
        border = "rounded",
      },
      ensure_installed = {
        "dprint",
        "selene",
        "shellcheck",
        "tfsec",
      },
    },
  },
}
