return {
  "Bekaboo/dropbar.nvim",
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
