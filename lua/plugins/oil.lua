require("balls").register({
  url = GH .. "nvim-tree/nvim-web-devicons",
  lazy = false,
})
require("balls").register({
  url = GH .. "stevearc/oil.nvim",
  lazy = false,
})

require("oil").setup({
  columns = {
    "icon",
    -- "size",
  },
  -- buf_options = {}
  win_options = {
    wrap = true,
    signcolumn = "yes",
    cursorcolumn = true,
    foldcolumn = "0",
    spell = false,
    list = false,
    conceallevel = 3,
    concealcursor = "n",
  },
  default_file_explorer = true,
  restore_win_options = true,
  use_default_keymaps = true,
  view_options = {
    show_hidden = true,
    is_always_hidden = function(name)
      return name == ".."
    end,
  },
  float = {
    padding = 2,
    max_width = 0,
    max_height = 0,
    border = "rounded",
    win_options = {
      winblend = 10,
    },
  },
  silence_netrw_warning = true,
})
vim.keymap.set("n", "-", "<cmd>Oil<CR>")
