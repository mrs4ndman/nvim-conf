-- This plugin creates a permalink to the selected code for the repository it is
-- in, for sharing quick and permanent code snippets.
return {
  "ruifm/gitlinker.nvim",
  keys = {
    { "<leader>gy", mode = { "n", "v" }, desc = "[Git] Create codelink" },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    require("gitlinker").setup()
  end,
}
