-- LSP Explicit config
local M = {}

local lspconfig = require("lspconfig")

-- Defining capabilities for LSPs
local internal_capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities = require("cmp_nvim_lsp").default_capabilities(internal_capabilities)
-- INFO: For Vue LS
-- M.capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = true

---@diagnostic disable-next-line: missing-fields
M.capabilities.textDocument.completion.completionItem = {
  documentationFormat = { "markdown", "plaintext" },
  snippetSupport = true,
  preselectSupport = true,
  insertReplaceSupport = true,
  deprecatedSupport = true,
  commitCharactersSupport = true,
  tagSupport = { valueSet = { 1 } },
  resolveSupport = {
    properties = { "documentation", "detail", "additionalTextEdits" },
  },
}

-- First, Native LSP attach
M.on_attach = function(client, bufnr)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, { noremap = true, desc = "[LSP] Go to Definition", buffer = bufnr })
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { noremap = true, desc = "[LSP] Go to Declaration", buffer = bufnr })
  vim.keymap.set("n", "gT", vim.lsp.buf.type_definition, { noremap = true, desc = "[LSP] Go to Type definition", buffer = bufnr })
  vim.keymap.set("n", "gI", vim.lsp.buf.implementation, { noremap = true, desc = "[LSP] Go to Implementation", buffer = bufnr })
  vim.keymap.set("n", "K", vim.lsp.buf.hover, { noremap = true, desc = "[LSP] Hover info", buffer = bufnr })
  -- stylua: ignore
  vim.keymap.set("n", "<leader>tD", "<cmd>Telescope lsp_dynamic_document_symbols<CR>",
    { desc = "[LSP] Dynamic document symbols", buffer = bufnr })
  vim.keymap.set("n", "<leader>tW", "<cmd>Telescope lsp_dynamic_workspace_symbols<CR>", { desc = "[LSP] Dynamic workspace symbols", buffer = bufnr })
  vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { noremap = true, desc = "[LSP] Previous diagnostic", buffer = bufnr })
  vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { noremap = true, desc = "[LSP] Next diagnostic", buffer = bufnr })
  vim.keymap.set({ "n", "v" }, "<leader>vca", vim.lsp.buf.code_action, { noremap = true, desc = "[LSP] View code actions", buffer = bufnr })
  vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, { noremap = true, desc = "[LSP} Show references", buffer = bufnr })
  vim.keymap.set({ "n", "v" }, "<leader>vrn", vim.lsp.buf.rename, { noremap = true, desc = "[LSP] Rename element under cursor", buffer = bufnr })
  vim.keymap.set("n", "<C-n>", vim.lsp.buf.signature_help, { noremap = true, desc = "[LSP] Signature help", buffer = bufnr })

  -- TODO: Need to configure this for the ones that need it:
  if client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
    vim.lsp.inlay_hint.enable(bufnr, false)
    vim.keymap.set("n", "<leader>ih", function()
      if vim.lsp.inlay_hint.is_enabled(0) then
        vim.lsp.inlay_hint.enable(0, false)
      else
        vim.lsp.inlay_hint.enable(0, true)
      end
    end, { desc = "Toggle Inlay hints" })
  end

  -- INFO: For Typescript
  if client.name == "tsserver" then
    vim.keymap.set("n", "<leader>fR", "<cmd>TypescriptRenameFile<CR>", { desc = "[Typescript] Rename file" })
    vim.keymap.set("n", "<leader>oi", "<cmd>TypescriptOrganizeImports<CR>", { desc = "[Typescript] Organize imports" })
    vim.keymap.set("n", "<leader>ru", "<cmd>TypescriptRemoveUnused<CR>", { desc = "[Typescript] Remove unused" })
  end
  if client.name == "jdtls" then
    require("jdtls").setup_dap({ hotcodereplace = "auto" })
    require("jdtls.dap").setup_dap_main_class_configs()
    vim.lsp.codelens.refresh()
  end

  -- INFO: For Svelte
  -- vim.api.nvim_create_autocmd("BufWritePost", {
  --   pattern = { "*.js", "*.ts" },
  --   callback = function(ctx)
  --     if client.name == "svelte" then
  --       client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.file })
  --     end
  --   end,
  -- })

  --- Floating diagnostic window on cursor
  vim.api.nvim_create_autocmd("CursorHold", {
    buffer = bufnr,
    callback = function()
      local opts = {
        focusable = false,
        close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
        border = "rounded",
        source = "always",
        prefix = " ",
        scope = "cursor",
      }
      vim.diagnostic.open_float(nil, opts)
    end,
  })

  -- Success!
  print("On-Attach LSP loaded")
end
-- LSP Server setups

M.setup = function()
  require("custom.lsp.servers")
  require("custom.lsp.diagnostics")
end

return M
