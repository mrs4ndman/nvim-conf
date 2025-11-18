return {
  "ggandor/leap.nvim",
  dependencies = {
    "ggandor/leap-spooky.nvim",
  },
  event = { "BufReadPost", "BufNewFile" },
  -- lazy = false,
  config = function()
    require("leap").setup = {
      -- max_phase_one_targets = 50,
      highlight_unlabeled_phase_one_targets = false,
    }
    require("leap-spooky").setup({
      -- Mappings will be generated corresponding to all native text objects,
      -- like: (ir|ar|iR|aR|im|am|iM|aM){obj}.
      -- Special line objects will also be added, by repeating the affixes.
      -- E.g. `yrr<leap>` and `ymm<leap>` will yank a line in the current
      -- window.
      affixes = {
        -- The cursor moves to the targeted object, and stays there.
        magnetic = { window = "m", cross_window = "M" },
        -- The operation is executed seemingly remotely (the cursor boomerangs
        -- back afterwards).
        remote = { window = "r", cross_window = "R" },
      },
      -- Defines text objects like `riw`, `raw`, etc., instead of
      -- targets.vim-style `irw`, `arw`. (Note: prefix is forced if a custom
      -- text object does not start with "a" or "i".)
      prefix = false,
      -- The yanked text will automatically be pasted at the cursor position
      -- if the unnamed register is in use.
      paste_on_remote_yank = false,
    })
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
