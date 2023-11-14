vim.bo.shiftwidth = 4
vim.bo.tabstop = 4
vim.bo.expandtab = true
vim.bo.softtabstop = 4

local home = os.getenv("HOME")
local capabilities = require("custom.lsp.init").capabilities
local on_attach = require("custom.lsp.init").on_attach

local config = {
  capabilities = capabilities,
  on_attach = on_attach,
  cmd = { home .. "/.local/share/nvim/mason/bin/jdtls" },
  root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw" }, { upward = true })[1]),
  settings = {
    java = {
      configuration = { updateBuildConfiguration = "interactive" },
      eclipse = { downloadSources = true },
      maven = { downloadSources = true },
      implementationsCodeLens = { enabled = true },
      referencesCodeLens = { enabled = true },
      inlayHints = {
        parameterNames = {
          enabled = "all", -- literals, all, none
        },
      },
      format = { enabled = false },
      signatureHelp = { enabled = true },
    },
  },
  init_options = {
    bundles = {
      ---@diagnostic disable-next-line: param-type-mismatch
      vim.fn.glob(home .. "/.local/share/nvim/mason/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar", 0),
    },
  },
}

require("jdtls").start_or_attach(config)
require("custom.lsp.diagnostics")
