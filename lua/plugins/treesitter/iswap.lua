Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "iswap.nvim"

return {
  "mizlan/" .. plugin,
  enabled = Is_Enabled(plugin),
  cmd = "ISwap",
  keys = {
    { "<leader>is", "<cmd>ISwap<CR>", desc = "[iswap] Start swap" },
    { "<leader>sw", "<cmd>ISwapWith<CR>", desc = "[iswap] Swap current item" },
    { "<leader>sn", "<cmd>ISwapNode<CR>", desc = "[iswap] Swap current node" },
    { "<leader>sl", "<cmd>ISwapNodeWithLeft<CR>", desc = "[iswap] Swap current node with left one" },
    { "<leader>mw", "<cmd>IMoveWith<CR>", desc = "[iswap] Move current item" },
  },
  opts = { keys = "ahsjdkfluiop", autoswap = true }
}
