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
      { "<M-h>", "<cmd>TmuxNavigateLeft<CR>", desc = "[tmux] Navigate to the pane to the left" },
      { "<M-j>", "<cmd>TmuxNavigateDown<CR>", desc = "[tmux] Navigate to the pane below" },
      { "<M-k>", "<cmd>TmuxNavigateUp<CR>", desc = "[tmux] Navigate to the pane above" },
      { "<M-l>", "<cmd>TmuxNavigateRight<CR>", desc = "[tmux] Navigate to the pane to the right" },
    },
    init = function()
      vim.g.tmux_navigator_no_mappings = 1
    end
  },
}
