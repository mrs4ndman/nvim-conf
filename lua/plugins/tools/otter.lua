return {
  "jmbuhr/otter.nvim",
  ft = "markdown",
  dependencies = {
    "neovim/nvim-lspconfig",
    "hrsh7th/nvim-cmp",
  },
  opts = {
    buffers = {
      -- if set to true, the filetype of the otterbuffers will be set.
      -- otherwise only the autocommand of lspconfig that attaches
      -- the language server will be executed without setting the filetype
      set_filetype = true,
    },
  },
  config = function()
    local extensions = require("otter.tools.extensions")

    extensions.rust = "rs"
    -- extensions.java = "java"
  end,
}
