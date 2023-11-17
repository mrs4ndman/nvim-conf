Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "git-blame.nvim"

return {
  "f-person/" .. plugin,
  enabled = Is_Enabled(plugin),
  keys = {
    { "<leader>gb", "<cmd>GitBlameToggle<CR>", desc = "[Git] Blame Toggle" },
    { "<leader>go", "<cmd>GitBlameOpenCommitURL<CR>", desc = "[Git] Open Commit URL" },
    { "<leader>gO", "<cmd>GitBlameOpenFileURL<CR>", desc = "[Git] Open File URL" },
    { "<leader>gch", "<cmd>GitBlameCopySHA<CR>", desc = "[Git] Copy Blame Commit SHA" },
    { "<leader>gcu", "<cmd>GitBlameCopyCommitURL<CR>", desc = "[Git] Copy Commit URL" },
    { "<leader>gcf", "<cmd>GitBlameCopyFileURL<CR>", desc = "[Git] Copy File URL" },
  },
  opts = {
    enabled = false,
    message_when_not_committed = "Not yet?",
  },
}
