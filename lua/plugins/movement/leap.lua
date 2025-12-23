return {
  url = "https://codeberg.org/andyg/leap.nvim.git",
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
    do
      -- Returns an argument table for `leap()`, tailored for f/t-motions.
      local function as_ft(key_specific_args)
        local common_args = {

          inputlen = 1,

          inclusive = true,

          -- To limit search scope to the current line:

          -- pattern = function (pat) return '\\%.l'..pat end,

          opts = {

            labels = "", -- force autojump

            safe_labels = vim.fn.mode(1):match("o") and "" or nil, -- [1]

            case_sensitive = true, -- [2]
          },
        }

        return vim.tbl_deep_extend("keep", common_args, key_specific_args)
      end

      local clever = require("leap.user").with_traversal_keys -- [3]

      local clever_f = clever("f", "F")

      local clever_t = clever("t", "T")

      for key, args in pairs({

        f = { opts = clever_f },

        F = { backward = true, opts = clever_f },

        t = { offset = -1, opts = clever_t },

        T = { backward = true, offset = 1, opts = clever_t },
      }) do
        vim.keymap.set({ "n", "x", "o" }, key, function()
          require("leap").leap(as_ft(args))
        end, { desc = "[Leap] " .. key .. " enhanced" })
      end
    end
  end,
  keys = {
    {
      "S",
      mode = "n",
      function()
        local current_window = vim.fn.win_getid()
        require("leap").leap({ target_windows = { current_window }, opts = { labels = "sfnjklhodweimbuyvrgtaqpcxz/SFNJKLHODWEIMBUYVRGTAQPCXZ?"}})
        vim.cmd([[:normal zz]])
      end,
      desc = "bidirectional leap",
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
