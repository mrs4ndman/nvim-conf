return {
  "folke/trouble.nvim",
  cmd = { "TroubleToggle", "Trouble" },
  keys = {
    { "<leader>xx", "<cmd>Trouble quickfix<CR>", desc = "[Trouble] Toggle list" },
    { "<leader>xl", "<cmd>Trouble loclist<CR>", desc = "[Trouble] Toggle loclist" },
    { "<leader>xd", "<cmd>Trouble document_diagnostics<CR>", desc = "[Trouble] Toggle diagnostics" },
    { "gr", "<cmd>Trouble lsp_references<CR>", desc = "[Trouble] LSP References" },
  },
}
