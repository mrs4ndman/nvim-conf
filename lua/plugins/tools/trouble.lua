return {
  "folke/trouble.nvim",
  lazy = false,
  keys = {
    { "<leader>xq", "<cmd>Trouble qflist toggle<CR>", desc = "[Trouble] Toggle list" },
    { "<leader>xs", "<cmd>Trouble symbols toggle focus=false<CR>", desc = "[Trouble] Toggle loclist" },
    { "<leader>xd", "<cmd>Trouble diagnostics toggle<CR>", desc = "[Trouble] Toggle diagnostics" },
    { "<leader>xb", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", desc = "[Trouble] Toggle diagnostics" },
    { "<leader>xb", "<cmd>Trouble lsp toggle focus=false win.position=right<CR>", desc = "[Trouble] Toggle diagnostics" },
    { "gr", "<cmd>Trouble lsp_references<CR>", desc = "[Trouble] LSP References" },
  },
  opts = {}
}
