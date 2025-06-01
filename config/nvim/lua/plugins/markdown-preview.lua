return {
  "iamcco/markdown-preview.nvim",
  ft = { "markdown" },
  build = "cd app && npm install",
  config = function()
    -- Set the preview theme to light
    vim.g.mkdp_theme = "light"
  end,
}
