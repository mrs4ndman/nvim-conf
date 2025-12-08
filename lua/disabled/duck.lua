return {
  "tamton-aquib/duck.nvim",
  keys = {
    { "<leader>da", desc = "Hatch amogus"},
    { "<leader>dc", desc = "Hatch cat"},
    { "<leader>dk", desc = "Cook pet"},
  },
  config = function()
    vim.keymap.set('n', '<leader>da', function() require("duck").hatch("ඞ", 7) end, {})
    vim.keymap.set('n', '<leader>dc', function() require("duck").hatch("🐈", 2) end, {})
    vim.keymap.set('n', '<leader>dk', function() require("duck").cook() end, {})
  end
}
