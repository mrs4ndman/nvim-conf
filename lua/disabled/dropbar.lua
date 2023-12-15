return {
  "Bekaboo/dropbar.nvim",
  enabled = false,
  event = "BufReadPost",
  keys = {
    {
      "<leader>nv",
      function()
        require("dropbar.api").pick()
      end,
      desc = "[UI] Pick element to navigate",
    },
  },
  opts = {
    bar = {
      pick = { pivots = "asdfhjlkqweruioptyzxcvbnm" },
    },
  },
}
