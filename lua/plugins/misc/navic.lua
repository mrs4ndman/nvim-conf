return {
  "SmiteshP/nvim-navic",
  enabled = true,
  lazy = false,
  config = function()
    require("nvim-navic").setup({
      separator = "  ",
      highlight = true,
      lsp = { auto_attach = true },
      depth_limit = 4,
    })
  end,
}
