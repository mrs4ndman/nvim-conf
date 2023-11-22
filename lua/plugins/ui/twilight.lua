return {
  "folke/twilight.nvim",
  -- event = "BufReadPost",
  cmd = "Twilight",
  keys = {
    { "<leader>zt", "<cmd>Twilight<CR>", desc = "[Twilight] Toggle" },
  },
  opts = {
    {
      alpha = 0.25,
      color = { "Normal", "#ffffff" },
      term_bg = "#000000",
      inactive = true,
    },
    context = 40,
    treesitter = true,
    expand = {
      "function",
      "method",
      "table",
      "if_statement",
    },
    exclude = { "alpha", "git" },
  },
}
