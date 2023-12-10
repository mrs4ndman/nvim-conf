-- Rust babyyyy
return {
  "saecki/crates.nvim",
  ft = "rust",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("crates").setup()
  end,
}
