-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- general
vim.keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- visual
vim.keymap.set("v", "<", "<gv", { desc = "Stay in right indentation mode" }) -- right indentation
vim.keymap.set("v", ">", ">gv", { desc = "Stay in left indentation mode" }) -- left indentation

-- lazydocker
vim.keymap.set("n", "<leader>dd", function()
  require("snacks").terminal({ "lazydocker" }, { env = { PWD = vim.fn.getcwd() } })
end, { desc = "LazyDocker" })
