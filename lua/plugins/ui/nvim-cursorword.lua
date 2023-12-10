return {
  "xiyaowong/nvim-cursorword",
  keys = {
    { "<leader>iw", "<cmd>CursorWordToggle<CR>", desc = "Word HL toggle" },
  },
  lazy = false,
  cmd = {
    "CursorWordToggle",
    "CursorWordDisable",
    "CursorWordEnable",
  },
}
