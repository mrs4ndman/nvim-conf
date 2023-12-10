return {
  "neovim/nvim-lspconfig",
  event = "BufReadPost",
  dependencies = {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    {
      url = "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
      config = function()
        require("lsp_lines").setup()
        -- LSP_LINES TOGGLE
        vim.keymap.set({ "n", "v" }, "<leader>vl", require("lsp_lines").toggle, { desc = "[LSP] Toggle extra line diagnostics" })
      end,
    },
  },
  main = "custom.lsp",
  config = true,
}
