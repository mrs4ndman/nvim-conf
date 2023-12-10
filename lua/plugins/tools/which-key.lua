return {
  "folke/which-key.nvim",
  keys = { " " },
  opts = {
    key_labels = {
      ["<leader>"] = "Space",
      ["ñ"] = "Meta",
    },
    icons = {
      group = "",
    },
    window = {
      border = "single",
      margin = { 0, 4, 1, 1 },
      padding = { 0, 4, 2, 1 },
    },
    layout = {
      spacing = 2,
      align = "center",
    },
  },
  config = function(_, opts)
    require("which-key").setup(opts)
---@diagnostic disable-next-line: different-requires
    require("custom.which-key")
  end,
}
