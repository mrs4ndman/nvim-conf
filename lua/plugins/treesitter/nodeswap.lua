return {
  "Wansmer/sibling-swap.nvim",
  keys = {
    {
      "<leader>sn",
      function()
        require("sibling-swap").swap_with_right()
      end,
      desc = "[swap] swap with next",
    },
    {
      "<leader>sp",
      function()
        require("sibling-swap").swap_with_left()
      end,
      desc = "[swap] swap with previous",
    }
  },
  opts = {
    use_default_keymaps = false,
  },
}
