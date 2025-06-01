return {
  "MagicDuck/grug-far.nvim",
  version = "1.6.3",

  -- Only load this plugin when these commands are used (lazy loading)
  cmd = { "GrugFar", "GrugFarWithin" },

  -- This is just like LazyVim's `keys` table, but adds the `flags` prefills option
  keys = {
    {
      "<leader>sr",
      function()
        local grug = require("grug-far")
        -- local ext = vim.bo.buftype == "" and vim.fn.expand("%:e")
        grug.open({
          transient = true,
          prefills = {
            -- Do not filter by file extension by default
            -- Uncomment the next line and `local ext` above
            -- to default to filter by file extension
            -- filesFilter = ext and ext ~= "" and "*." .. ext or nil,
            flags = "--hidden --glob !.git/ --no-ignore",
          },
        })
      end,
      mode = { "n", "v" },
      desc = "Search and Replace",
    },
  },

  -- Plugin configuration
  config = function()
    -- Set up an autocmd (auto command) to trigger on the "grug-far" filetype
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "grug-far" },
      callback = function()
        -- Map <Alt-h> to toggle searching hidden files (but excluding .git)
        vim.keymap.set({ "i", "n", "x" }, "<A-h>", function()
          local state = unpack(require("grug-far").get_instance(0):toggle_flags({ "--hidden", "--glob !.git/" }))
          vim.notify("grug-far: toggled --hidden --glob !.git/ " .. (state and "ON" or "OFF"))
        end, { desc = "Toggle Hidden Files", buffer = true })

        -- Map <Alt-i> to toggle ignoring .gitignore rules
        vim.keymap.set({ "i", "n", "x" }, "<A-i>", function()
          local state = unpack(require("grug-far").get_instance(0):toggle_flags({ "--no-ignore" }))
          vim.notify("grug-far: toggled --no-ignore " .. (state and "ON" or "OFF"))
        end, { desc = "Toggle Ignored Files", buffer = true })
      end,
    })
  end,

  -- Initialization code: runs earlier than `config`, good for keymaps
  init = function()
    -- In visual mode, search across all files with selection as input
    vim.keymap.set("x", "<leader>sRa", ":lua require('grug-far').with_visual_selection()<CR>", { desc = "All Files" })

    -- In normal mode, search in current file only
    vim.keymap.set(
      "n",
      "<leader>sRc",
      ":lua require('grug-far').open({ prefills = { paths = vim.fn.expand('%') } })<CR>",
      { desc = "Current File" }
    )

    -- In visual mode, search in current file only with selection
    vim.keymap.set(
      "x",
      "<leader>sRc",
      ":lua require('grug-far').with_visual_selection({ prefills = { paths = vim.fn.expand('%') } })<CR>",
      { desc = "Current File" }
    )

    -- In visual mode, search within selected text range only
    vim.keymap.set("x", "<leader>sRw", ":GrugFarWithin<CR>", { desc = "Within Range" })
  end,
}
