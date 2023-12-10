local plugin = ""

return {
  "echasnovski/mini.ai" .. plugin,
  event = { "BufRead", "BufNewFile" },
  config = function()
    require("mini.ai").setup({
      custom_textobjects = {
        f = false,
      },
      mappings = {
        around = "a",
        inside = "i",
        around_next = "an",
        inside_next = "in",
        around_last = "al",
        inside_last = "il",
        goto_left = "g[",
        goto_right = "g]",
      },
      silent = true,
      n_lines = 100,
    })
  end,
}
