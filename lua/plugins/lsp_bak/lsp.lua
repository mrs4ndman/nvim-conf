require("balls").register({ 
  url = "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
  callback = function(event, plugin)
    require("lsp_lines").setup()
    -- LSP_LINES TOGGLE
    vim.keymap.set({ "n", "v" }, "<leader>vl", require("lsp_lines").toggle, { desc = "[LSP] Toggle extra line diagnostics" })
  end
})
require("balls")
.register({ url = "https://github.com/williamboman/mason.nvim" })
require("balls")
.register({ url = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" })

require("balls")
.register({ url = "https://github.com/neovim/nvim-lspconfig", lazy = true })
:load_on("BufReadPost", {
  callback = function(event, plugin)
    require("custom.lsp")
  end
})
