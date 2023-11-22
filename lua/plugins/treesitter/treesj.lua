return {
  "Wansmer/treesj",
  cmd = { "TSJJoin", "TSJSplit", "TSJToggle" },
  keys = {
    { "Q", "<cmd>TSJToggle<CR>", desc = "[TSJ] Toggle node" },
  },
  opts = {
    use_default_keymaps = false,
    check_syntax_error = false,
    max_join_length = 300,
    cursor_behaviour = "hold",
    notify = true,
    dot_repeat = true,
  },
}
