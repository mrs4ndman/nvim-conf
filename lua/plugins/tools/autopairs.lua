return {
  -- 9.- Autopairs & tabout for tabbing out of said pairs
  "windwp/nvim-autopairs",
  event = { "BufRead", "BufNewFile" },
  config = function()
    require("nvim-autopairs").setup({
      check_ts = true,
    })
  end,
}
