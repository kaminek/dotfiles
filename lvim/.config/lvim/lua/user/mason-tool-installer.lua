local M = {}

M.config = function()
  local status_ok, mason_tool_installer = pcall(require, "mason-tool-installer")
  if not status_ok then
    return
  end

  mason_tool_installer.setup {

    -- a list of all tools you want to ensure are installed upon
    -- start; they should be the names Mason uses for each tool
    ensure_installed = {
      -- you can pin a tool to a particular version
      -- { 'golangci-lint', version = '1.47.0' },
      -- you can turn off/on auto_update per tool
      -- { 'bash-language-server', auto_update = true },
      -- bash
      "shellcheck",
      "shfmt",
      -- lua
      "stylua",
      "selene",
      -- golang
      "golangci-lint",
      "gofumpt",
      -- python
      "black",
      "flake8",
      -- markdown
      "markdownlint",
      "write-good",
      -- js shit
      "prettier",
      "eslint_d",
      -- json
      "jq",
      -- docker
      "dockerfile-language-server",
      -- "hadolint",
      -- protobuf
      "buf",
      "buf-language-server",
      -- TOML
      "taplo",
      -- TF
      "terraform-ls",
      "tfsec",
      -- Rust
      "rust-analyzer",
    },

    -- if set to true this will check each tool for updates. If updates
    -- are available the tool will be updated. This setting does not
    -- affect :MasonToolsUpdate or :MasonToolsInstall.
    -- Default: false
    auto_update = false,

    -- automatically install / update on startup. If set to false nothing
    -- will happen on startup. You can use :MasonToolsInstall or
    -- :MasonToolsUpdate to install tools and check for updates.
    -- Default: true
    run_on_start = false,

    -- set a delay (in ms) before the installation starts. This is only
    -- effective if run_on_start is set to true.
    -- e.g.: 5000 = 5 second delay, 10000 = 10 second delay, etc...
    -- Default: 0
    start_delay = 3000, -- 3 second delay
  }
end

return M
