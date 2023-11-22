return {
  "NvChad/nvim-colorizer.lua",
  keys = {
    { "<localleader>c", "<cmd>ColorizerToggle<CR>", desc = "Color picker toggle" },
  },
  config = function()
    require("colorizer").setup({
      filetypes = {
        "css",
        "scss",
        "html",
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "vue",
        "php",
        "markdown",
        "yaml",
        "tmux",
        lua = {
          names = false,
        },
      },
      user_default_options = {
        RRGGBBAA = true,
        rgb_fn = true,
        hsl_fn = true,
        css = true,
        css_fn = true,
        mode = "background",
        tailwind = true,
      },
    })
  end,
}
