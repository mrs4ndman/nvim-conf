return {
  {
    "tmux-plugins/vim-tmux",
    enabled = os.getenv("TMUX") ~= nil,
    event = "VimEnter",
  },
  {
    "christoomey/vim-tmux-navigator",
    enabled = os.getenv("TMUX") ~= nil,
    keys = {
      { "<M-h>", "<cmd>TmuxNavigateLeft<CR>", desc = "Navigate to left pane" },
      { "<M-j>", "<cmd>TmuxNavigateDown<CR>", desc = "Navigate to left pane" },
      { "<M-k>", "<cmd>TmuxNavigateUp<CR>", desc = "Navigate to left pane" },
      { "<M-l>", "<cmd>TmuxNavigateRight<CR>", desc = "Navigate to left pane" },
    },
    init = function()
      vim.g.tmux_navigator_no_mappings = 1
    end
  },
}
