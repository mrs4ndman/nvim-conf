-- MAYBE
return {
  "mizlan/iswap.nvim",
  cmd = "ISwap",
  keys = {
    { "<leader>is", "<cmd>ISwap<CR>", desc = "[iswap] Start swap" },
    { "<leader>sw", "<cmd>ISwapWith<CR>", desc = "[iswap] Swap current item" },
    { "<leader>sn", "<cmd>ISwapNode<CR>", desc = "[iswap] Swap current node" },
    { "<leader>sl", "<cmd>ISwapNodeWithLeft<CR>", desc = "[iswap] Swap current node with left one" },
    { "<leader>mw", "<cmd>IMoveWith<CR>", desc = "[iswap] Move current item" },
  },
  opts = { keys = "ahsjdkfluiop", autoswap = true },
}
