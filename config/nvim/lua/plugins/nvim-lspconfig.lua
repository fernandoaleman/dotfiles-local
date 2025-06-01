local util = require("lspconfig.util")

return {
  "neovim/nvim-lspconfig",
  opts = function(_, opts)
    opts.servers = opts.servers or {}

    -- Solargraph configuration for Ruby
    opts.servers.solargraph = {
      cmd = { vim.fn.expand("$HOME/.asdf/shims/solargraph"), "stdio" },
      filetypes = { "ruby" },
      root_dir = util.root_pattern("Gemfile", ".git"),
      settings = {
        solargraph = {
          autoformat = true,
          completion = true,
          diagnostic = true,
          folding = true,
          references = true,
          rename = true,
          symbols = true,
        },
      },
    }

    -- YAML Language Server configuration
    opts.servers.yamlls = {
      settings = {
        yaml = {
          schemas = {
            ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = {
              "docker-compose.yml",
              "docker-compose.yaml",
            },
            ["https://json.schemastore.org/pre-commit-config.json"] = "/.pre-commit-config.yaml",
          },
          schemaStore = {
            enable = true,
          },
        },
      },
    }
  end,
}
