return {
  "ellisonleao/carbon-now.nvim",
  lazy = true,
  cmd = "CarbonNow",
  keys = {
    { mode = { "n", "v" }, "<leader>cn", "<cmd>CarbonNow<CR>" },
  },
  opts = {
    options = {
      bg = "gray",
      drop_shadow = true,
      font_family = "JetBrains Mono",
      theme = "Material",
      titlebar = "carbon-now.nvim snippet",
      watermark = false,
    },
  },
}
