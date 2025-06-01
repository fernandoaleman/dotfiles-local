return {
  "mfussenegger/nvim-lint",
  opts = {
    linters_by_ft = {
      jinja = { "djlint" },
      jinja2 = { "djlint" },
    },
  },
  config = function(_, opts)
    local lint = require("lint")

    lint.linters.djlint = {
      name = "djlint",
      cmd = "djlint",
      stdin = false,
      args = { "--lint", "-" },
      stream = "stdout",
      parser = require("lint.parser").from_errorformat("%f:%l:%c %m", {
        source = "djlint",
      }),
    }

    lint.linters_by_ft = opts.linters_by_ft
  end,
}
