-- Rust babyyyy
return {
  {
    "saecki/crates.nvim",
    ft = "rust",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("crates").setup()
    end,
  },
  {
    "alexpasmantier/krust.nvim",
    ft = "rust",
    cmd = "Krust",
    opts = {
      keymap = "<leader>E",
      float_win = {
        border = "rounded",
        auto_focus = false,
      },
    },
  },
}
