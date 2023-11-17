Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "nvim-lspconfig"

return {
  "neovim/" .. plugin,
  enabled = Is_Enabled(plugin),
  event = "BufReadPost",
  dependencies = {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    {
      url = "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
      config = function()
        require("lsp_lines").setup()
        -- LSP_LINES TOGGLE
        vim.keymap.set(
          { "n", "v" },
          "<leader>vl",
          require("lsp_lines").toggle,
          { desc = "[LSP] Toggle extra line diagnostics" }
        )
      end,
    },
  },
  main = "custom.lsp",
  config = true,
}
