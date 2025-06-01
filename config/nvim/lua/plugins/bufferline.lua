return {
  "akinsho/bufferline.nvim",
  opts = {
    options = {
      -- Ensures bufferline is always visible
      always_show_bufferline = true,

      -- Hide close button (not working ?)
      show_close_icon = false,

      -- Change separator style
      separator_style = "thin",

      -- Show LSP diagnostics in the bufferline (optional)
      diagnostics = "nvim_lsp",
      diagnostics_indicator = function(count, level)
        local icon = (level == "error" and " ") or (level == "warning" and " ") or ""
        return " " .. icon .. count
      end,
    },
  },
}
