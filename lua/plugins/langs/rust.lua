-- Rust babyyyy
return {
  "saecki/crates.nvim",
  enabled = Is_Enabled("crates.nvim"),
  ft = "rust",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("crates").setup()
  end,
}
