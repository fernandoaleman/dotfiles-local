-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- File formats
vim.opt.fileformats = { "unix", "mac" }

-- Ruby
vim.g.lazyvim_ruby_lsp = "solargraph"
vim.g.lazyvim_ruby_formatter = "rubocop"

-- Python
vim.g.lazyvim_python_lsp = "pyright"
vim.g.lazyvim_python_formatter = "black"
