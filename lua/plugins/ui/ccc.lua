return {
  "uga-rosa/ccc.nvim",
  lazy = true,
  keys = {
    { "<leader>cp", "<cmd>CccPick<CR>" },
  },
  config = function()
    local ccc = require("ccc")
    local mapping = ccc.mapping

    ccc.setup({
      -- Enabling highlighter
      highlighter = {
        auto_enable = true,
        lsp = true,
      },
      inputs = {
        ccc.input.rgb,
        ccc.input.hsl,
        ccc.input.cmyk,
        ccc.input.hsluv,
        ccc.input.okhsl,
      },
    })
  end,
}
