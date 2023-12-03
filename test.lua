-- local myTable = { "h", "e", "l", "l", "o" }
-- local combinedString = table.concat(myTable)
-- print(combinedString) -- Outputs hello

-- -- ENCODING -> UTF-8 etc.
-- local function encoding()
--     local fileencoding = vim.opt.fileencoding:get()
--     if fileencoding == nil then
--     -- if fileencoding == "nil" then
--         fileencoding = ""
--     end
--     -- return fileencoding ~= "" and string.format("%s", encoding) or ""
--     return tostring(fileencoding)
-- end

vim.keymap.set({ "n", "v" }, "<leader>F", function()
  local clients = vim.lsp.get_clients({
    method = "textDocument/format",
  })

  if #clients > 0 then
    vim.lsp.buf.format()
  else
    print("no formatter :(")
  end
end, { desc = "LSP formatting" })

vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", { undercurl = true })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", { undercurl = true })
vim.api.nvim_set_hl(0, "DiagnosticUnderlineHint", { undercurl = true })
