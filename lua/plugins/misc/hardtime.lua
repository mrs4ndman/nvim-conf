return {
  "m4xshen/hardtime.nvim",
  event = "BufReadPost",
  opts = {
    max_time = 1250,
    max_count = 5,
    disable_mouse = false,
    hint = true,
    notification = true,
    allow_different_key = true,
    disabled_keys = {
      ["<UP>"] = { "", "i" },
      ["<DOWN>"] = { "", "i" },
      ["<LEFT>"] = { "", "i" },
      ["<RIGHT>"] = { "", "i" },
    },
    disabled_filetypes = {
      "alpha",
      "qf",
      "netrw",
      "help",
      "md",
      "neotree",
      "lazy",
      "mason",
      "oil",
      "TelescopePrompt",
    },
  },
}
