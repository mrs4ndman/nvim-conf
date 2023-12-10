return {
  "ggandor/leap.nvim",
  event = { "BufReadPost", "BufNewFile" },
  -- lazy = false,
  config = function()
    require("leap").add_default_mappings()
    require("leap").setup = {
      -- max_phase_one_targets = 50,
      highlight_unlabeled_phase_one_targets = false,
    }
  end,
  keys = {
    {
      "<leader>lp",
      mode = { "n", "x", "o" },
      function()
        local current_window = vim.fn.win_getid()
        require("leap").leap({ target_windows = { current_window } })
        vim.cmd([[:normal zz]])
      end,
      desc = "Bidirectional leap",
    },
    {
      "<leader>la",
      mode = { "n", "x", "o" },
      function()
        local focusable_window_on_tabpage = vim.tbl_filter(function(win)
          return vim.api.nvim_win_get_config(win).focusable
        end, vim.api.nvim_tabpage_list_wins(0))
        require("leap").leap({ target_windows = focusable_window_on_tabpage })
        vim.cmd([[:normal zz]])
      end,
      desc = "Leap on all windows / buffers",
    },
  },
}
