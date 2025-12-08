return {
  "ray-x/go.nvim",
  enabled = false,
  config = function()
    require("go").setup()
  end,
  -- event = "VeryLazy",
  ft = { "go", "gomod" },
  build = ':lua require("go.install").update_all_sync()',
}
