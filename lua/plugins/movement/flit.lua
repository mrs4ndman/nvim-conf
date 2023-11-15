Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled

local plugin = "flit.nvim"

return {
  "ggandor/" .. plugin,
  enabled = Is_Enabled(plugin),
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
