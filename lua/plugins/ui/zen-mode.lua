return {
  "folke/zen-mode.nvim",
  keys = {
    { "<leader>zz", desc = "A bit Zen" },
    { "<leader>zZ", desc = "Even more Zen" },
  },
  config = function()
    -- ZEN-MODE
    vim.keymap.set("n", "<leader>zz", function()
      require("zen-mode").setup({
        window = {
          width = 90,
          options = {},
        },
      })
      require("zen-mode").toggle()
      vim.wo.wrap = false
      vim.wo.number = true
      vim.wo.rnu = true
    end)

    vim.keymap.set("n", "<leader>zZ", function()
      require("zen-mode").setup({
        window = {
          width = 90,
          options = {},
        },
      })
      require("zen-mode").toggle()
      vim.wo.wrap = false
      vim.wo.number = false
      vim.wo.rnu = false
      vim.opt.colorcolumn = "0"
    end)
  end,
}
