return {
  "lewis6991/gitsigns.nvim",
  lazy = false,
  keys = {
    { "<leader>Gh", "<cmd>Gitsigns stage_hunk<CR>", desc = "[] Stage hunk" },
    { "<leader>Guh", "<cmd>Gitsigns undo_stage_hunk<CR>", desc = "[] Undo hunk staging" },
    { "<leader>Grh", "<cmd>Gitsigns reset_hunk<CR>", desc = "[] Reset hunk" },
    { "<leader>Gb", "<cmd>Gitsigns blame_line<CR>", desc = "[] Blame line" },
    { "<leader>Gdt", "<cmd>Gitsigns diff_this<CR>", desc = "[] Diff current hunk" },
    { "]h", "<cmd>Gitsigns next_hunk<CR>", desc = "[] Next hunk" },
    { "[h", "<cmd>Gitsigns prev_hunk<CR>", desc = "[] Previous hunk" },
  },
  opts = {
    signs = {
      add = {
        hl = "DiffAdd",
        text = "+",
        numhl = "GitSignsAddNr",
      },
      change = {
        hl = "DiffChange",
        text = "󰇙",
        numhl = "GitSignsChangeNr",
      },
      delete = {
        hl = "DiffDelete",
        text = "_",
        show_count = true,
        numhl = "GitSignsDeleteNr",
      },
      topdelete = {
        hl = "DiffDelete",
        text = "‾",
        show_count = true,
        numhl = "GitSignsDeleteNr",
      },
      changedelete = {
        hl = "DiffChange",
        text = "~",
        show_count = true,
        numhl = "GitSignsChangeNr",
      },
    },
    count_chars = {
      [1] = "",
      [2] = "₂",
      [3] = "₃",
      [4] = "₄",
      [5] = "₅",
      [6] = "₆",
      [7] = "₇",
      [8] = "₈",
      [9] = "₉",
      ["+"] = "󰎿",
    },
    numhl = false,
    attach_to_untracked = true,
    trouble = false,
  },
  config = function(_, opts)
    require("gitsigns").setup(opts)
  end,
}
