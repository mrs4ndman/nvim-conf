return {
  "vyfor/cord.nvim",
  build = ":Cord update",
  lazy = false,
  keys = {
    { "<leader>ds", "<cmd>Cord presence<CR>", { desc = "[Discord] Toggle status" } },
  },
  opts = {
    {
      enabled = true,
      log_level = vim.log.levels.OFF,
      editor = {
        client = "Neovim",
        tooltip = "A pretty good text editor",
        icon = nil,
      },
      display = {
        theme = "classic",
        flavor = "dark",
        view = "full",
        swap_fields = false,
        swap_icons = false,
      },
      timestamp = {
        enabled = true,
        reset_on_idle = false,
        reset_on_change = false,
        shared = false,
      },
      idle = {
        enabled = true,
        timeout = 300000,
        show_status = true,
        ignore_focus = true,
        unidle_on_focus = true,
        smart_idle = true,
        details = "Idling",
        state = nil,
        tooltip = "💤",
        icon = nil,
      },
      buttons = nil,
      assets = nil,
      variables = nil,
      plugins = nil,
    },
  },
}
