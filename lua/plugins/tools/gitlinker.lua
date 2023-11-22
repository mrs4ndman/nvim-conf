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
