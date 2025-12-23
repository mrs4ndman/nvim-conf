return {
  "ggandor/flit.nvim",
  dependencies = { "tpope/vim-repeat" },
  enabled = false,
  event = "BufRead",
  -- lazy = true,
  opts = {
    keys = { f = "f", F = "F", t = "t", T = "T" },
    labeled_modes = "nv",
    multiline = true,
    opts = {},
  },
}
