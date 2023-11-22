return {
  "echasnovski/mini.indentscope",
  event = { "BufRead", "BufNewFile" },
  config = function()
    require("mini.indentscope").setup({
      draw = { delay = 25, priority = 1 },
      mappings = {
        object_scope = "ii",
        object_scope_with_borer = "ai",
        goto_top = "[i",
        goto_bottom = "]i",
      },
      options = {
        border = "both",
        indent_at_cursor = true,
      },
      symbol = require("core.icons").misc.vertical_bar,
    })
  end,
}
