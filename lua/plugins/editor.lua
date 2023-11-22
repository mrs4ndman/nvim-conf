-- Declarations
require("balls").register({
  url = GH .. "rcarriga/nvim-notify",
  lazy = false,
})
require("balls").register({
  url = GH .. "folke/noice.nvim",
  lazy = false,
})
require("balls").register({
  url = GH .. "MunifTanjim/nui.nvim",
  lazy = false,
})

require("balls").register({
  url = GH .. "rmagatti/auto-session",
  lazy = false,
})
-- Lua tabout finally working
  require("balls").register({
  url = GH .. "abecodes/tabout.nvim",
  lazy = false,
}):load_on("InsertEnter", {
  callback = function()
    require("tabout").setup({
      tabkey = "<Tab>",
      backwards_tabkey = "<S-Tab>",
      act_as_tab = true,
      act_as_shift_tab = false,
      enable_backwards = true,
      completion = true,
      tabouts = {
        { open = "'", close = "'" },
        { open = '"', close = '"' },
        { open = "`", close = "`" },
        { open = "(", close = ")" },
        { open = "[", close = "]" },
        { open = "{", close = "}" },
        { open = "<", close = ">" },
        -- {open = ':', close = ':'} -- Rust maybe?
      },
      ignore_beginning = true,
      exclude = {},
    })
  end
})

require("balls")
  .register({
    url = GH .. "numToStr/Comment.nvim",
    lazy = true,
  })
  :load_on({ "BufRead", "BufNewFile" }, {
    callback = function()
      require("Comment").setup({
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      })
    end,
  })

require("balls").register({
  url = GH .. "windwp/nvim-autopairs",
  lazy = false,
})

-- Config
require("nvim-autopairs").setup({
  check_ts = true,
})

require("notify").setup({
  stages = "static",
  timeout = 1500,
  render = "compact",
  max_height = function()
    return math.floor(vim.o.lines * 0.30)
  end,
  max_width = function()
    return math.floor(vim.o.columns * 0.35)
  end,
})
vim.notify = require("notify")

require("noice").setup({
  lsp = {
    progress = {
      enabled = true,
      view = "mini",
      throttle = 1000 / 60,
    },
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true,
    },
  },
  presets = {
    bottom_search = true,
    command_palette = true,
    long_message_to_split = true,
    inc_rename = true,
    lsp_doc_border = true,
  },
  routes = {
    view = "notify",
    filter = { event = "msg_showmode" },
  },
  views = {
    mini = {
      backend = "mini",
      timeout = 1500,
      size = { height = "auto", width = "auto", max_height = 5 },
      border = { style = "none" },
      zindex = 30,
      win_options = {
        winbar = "",
        foldenable = false,
        winblend = 40,
        winhighlight = { Normal = "NoiceMini" },
      },
    },
  },
})

require("auto-session").setup({
  log_level = "error",
  auto_session_suppress_dirs = { "~/", "~/install", "~/Downloads" },
  auto_session_create_enabled = false,
  auto_restore_enabled = false,
  auto_save_enabled = true,
  session_lens = {
    load_on_setup = false,
  },
})

vim.keymap.set("n", "<leader>sd", "<cmd>SessionDelete<CR>", { desc = "Delete current session" })
vim.keymap.set("n", "<leader>sr", "<cmd>SessionRestore<CR>", { desc = "Restore session for CWD" })
vim.keymap.set("n", "<leader>ss", "<cmd>SessionSave<CR>", { desc = "Save current session" })
