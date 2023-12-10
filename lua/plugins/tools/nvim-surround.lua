return {
  "kylechui/nvim-surround",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    keymaps = {
      normal = "ys",
      delete = "ds",
      visual = "S",
      visual_line = "gS",
      change = "cs",
      change_line = "cS",
    },
  },
}
