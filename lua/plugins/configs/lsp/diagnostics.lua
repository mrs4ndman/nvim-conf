vim.diagnostic.config({
  virtual_text = false,
  virtual_lines = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  signs = {
    text = {
      require("core.icons").diagnostics.ERROR,
      require("core.icons").diagnostics.WARN,
      require("core.icons").diagnostics.HINT,
      require("core.icons").diagnostics.INFO,
    },
  },
  float = {
    header = { "  Diagnostics", "String" },
    prefix = function(_, _, _)
      return "  ", "String"
    end,
  },
})
