return {
  "ggandor/flit.nvim",
  dependencies = { "tpope/vim-repeat" },
  event = "BufRead",
  -- lazy = false,
  opts = {
    keys = { f = "f", F = "F", t = "t", T = "T" },
    labeled_modes = "v",
    multiline = true,
    opts = {},
  },
}
