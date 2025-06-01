return {
  "mason-org/mason.nvim",
  -- Pin to version 1.0 until LazyVim is updated to account for
  -- mason-lspconfig.nvim 2.0 update
  -- Begin
  version = "^1.0.0",
  dependencies = {
    { "mason-org/mason-lspconfig.nvim", version = "^1.0.0" },
  },
  -- End
  opts = {
    ensure_installed = {
      "ansible-language-server",
      "ansible-lint",
    },
  },
}
