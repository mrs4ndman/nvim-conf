require("balls").register({
  url = GH .. "folke/tokyonight.nvim",
  lazy = false
})

require("tokyonight").setup({
  style = "night",
  light_style = "day",
  transparent = true,
  styles = {
    comments = { italic = true },
    keywords = { italic = true },
    functions = {},
    variables = {},
    sidebars = "dark",
    floats = "dark",
  },
  hide_inactive_statusline = false,
  dim_inactive = true,
})

vim.cmd("colorscheme tokyonight")
