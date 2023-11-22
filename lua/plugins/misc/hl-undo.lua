return {
  "tzachar/highlight-undo.nvim",
  event = { "BufRead", "BufNewFile" },
  config = function()
    require("highlight-undo").setup({
      duration = 250,
      undo = {
        hlgroup = "@text.diff.add",
        mode = { "n", "v" },
        lhs = "u",
        map = "undo",
        opts = {},
      },
      redo = {
        hlgroup = "@text.diff.delete",
        mode = { "n", "v" },
        lhs = "<C-r>",
        map = "redo",
        opts = {},
      },
    })
  end,
}
