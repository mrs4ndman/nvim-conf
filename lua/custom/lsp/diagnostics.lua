-- Change here the left sidebar LSP icon config for:
local signs = {
  Error = require("core.icons").diagnostics.ERROR,
  Warn = require("core.icons").diagnostics.WARN,
  Hint = require("core.icons").diagnostics.HINT,
  Info = require("core.icons").diagnostics.INFO,
}
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Goes with lsp_lines
vim.diagnostic.config({
  virtual_text = false,
  virtual_lines = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})
