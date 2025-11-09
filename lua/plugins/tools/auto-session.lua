return {
  "rmagatti/auto-session",
  event = "VimEnter",
  keys = {
    { "<leader>sd", "<cmd>AutoSession delete<CR>", desc = "Delete current session" },
    { "<leader>sr", "<cmd>AutoSession restore<CR>", desc = "Restore session for CWD" },
    { "<leader>ss", "<cmd>AutoSession save<CR>", desc = "Save current session" },
  },
  cmd = {
    "SessionRestore",
    "SessionSave",
    "SessionDelete",
  },
  opts = {
    auto_session_create_enabled = false,
    auto_restore = false,
    auto_save = true,
    bypass_save_filetypes = { "alpha", "dashboard" },
    log_level = "error",
    session_lens = {
      load_on_setup = false,
    },
    suppress_dirs = { "~/", "~/install", "~/Downloads" },
  },
}
