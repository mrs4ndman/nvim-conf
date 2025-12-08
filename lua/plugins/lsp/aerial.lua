return {
  "stevearc/aerial.nvim",
  cmd = "AerialToggle",
  keys = {
    { "<leader>A", "<cmd>AerialToggle left<CR>", desc = "[TS] Toggle Aerial window on the left" },
  },
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    backends = { "treesitter", "lsp", "markdown", "man" },
    layout = {
      max_width = { 50, 0.5 },
      -- width = nil,
      min_width = 20,
      default_direction = "prefer_right",
      preserve_equality = false,
      placement = "window",
    },
    close_automatic_events = { "unsupported", "unfocus" },
    disable_max_lines = 20000,
    highlight_closest = true,
    highlight_on_hover = true,
    autojump = true,
    ignore = {
      unlisted_buffers = true,
    },
    open_automatic = false,
    post_jump_cmd = "normal! zz",
    lsp = {
      diagnostics_trigger_update = true,
      update_when_errors = true,
      update_delay = 700,
    },
    treesitter = { update_delay = 700 },
    markdown = { update_delay = 800 },
    man = { update_delay = 900 },
  },
}
