return {
  {
    "tmux-plugins/vim-tmux",
    enabled = os.getenv("TMUX") ~= nil,
    event = "VeryLazy",
  },
  {
    "christoomey/vim-tmux-navigator",
    enabled = os.getenv("TMUX") ~= nil,
    keys = {
      { "<C-h>", "<cmd>TmuxNavigateLeft<CR>", desc = "Navigate to left pane" },
      { "<C-j>", "<cmd>TmuxNavigateDown<CR>", desc = "Navigate to left pane" },
      { "<C-k>", "<cmd>TmuxNavigateUp<CR>", desc = "Navigate to left pane" },
      { "<C-l>", "<cmd>TmuxNavigateRight<CR>", desc = "Navigate to left pane" },
    },
  },
}
