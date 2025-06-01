-- ~/.config/nvim/lua/plugins/conform.lua

-- this fixes rubocop errors in LazyVim when using ruby < 3
-- when using ruby version < 3, create a .lazy.lua in the root of the project and add the following

local function get_ruby_version()
  local handle = io.popen("ruby -e 'print RUBY_VERSION' 2>/dev/null")
  if handle then
    local result = handle:read("*a")
    handle:close()
    return result
  end
  return nil
end

local ruby_version = get_ruby_version()
local use_old_args = ruby_version and ruby_version:match("^2%.") -- true if Ruby version starts with 2.

return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      ruby = { "rubocop" },
      yaml = { "prettier" },
      jinja = {},
    },
    formatters = {
      rubocop = use_old_args and {
        command = os.getenv("HOME") .. "/.asdf/shims/rubocop",
        args = {
          "--auto-correct",
          "--format",
          "quiet",
          "--stderr",
          "--stdin",
          "$FILENAME",
        },
      } or {
        -- Ruby >= 3 settings
        command = "rubocop", -- assuming default path is fine
        args = { "--autocorrect", "--stdin", "$FILENAME", "--stderr", "--format", "quiet" },
      },
    },
  },
}
