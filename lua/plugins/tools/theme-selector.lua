return {
  "mrs4ndman/theme-selector.nvim",
  cmd = { "Themer" },
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
  dev = true,
  enabled = true,
  config = function()
    require("theme-selector.colorschemes").list = {
      "tokyonight",
      "catppuccin",
      "rose-pine",
      "tokyodark",
      "default",
      "oxocarbon",
      "enfocado",
      "fluoromachine",
      "github_dark_high_contrast",
    }
    require("theme-selector")
  end,
}
