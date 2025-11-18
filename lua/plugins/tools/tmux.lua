return {
  {
    "tmux-plugins/vim-tmux",
    lazy = false,
    event = "VimEnter",
  },
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
    enabled = true,
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
      "TmuxNavigatorProcessList",
    },
    keys = {
      { "<M-h>", "<cmd>TmuxNavigateLeft<CR>", desc = "[tmux] Navigate to the pane to the left" },
      { "<M-j>", "<cmd>TmuxNavigateDown<CR>", desc = "[tmux] Navigate to the pane below" },
      { "<M-k>", "<cmd>TmuxNavigateUp<CR>", desc = "[tmux] Navigate to the pane above" },
      { "<M-l>", "<cmd>TmuxNavigateRight<CR>", desc = "[tmux] Navigate to the pane to the right" },
      { "<M-p>", "<cmd>TmuxNavigatePrevious<CR>", desc = "[tmux] Navigate to the pane to the right" },
    },
  },
  {
    "vimpostor/vim-tpipeline",
    lazy = false,
    cond = function()
      return vim.env.TMUX ~= nil
    end,
    init = function()
      vim.g.tpipeline_autoembed = 0
      vim.cmd("set laststatus=0")
      vim.g.tpipeline_statusline = ""
    end,
  },
}
