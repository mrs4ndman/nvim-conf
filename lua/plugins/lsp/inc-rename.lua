return {
  "smjonas/inc-rename.nvim",
  keys = {
    {
      "<leader>rf",
      function()
        return ":IncRename " .. vim.fn.expand("<cword>")
      end,
      expr = true,
      desc = "[inc-rename] Rename symbol under cursor",
    },
  },
  cmd = "IncRename",
  opts = {
    input_buffer_type = "dressing",
  },
}
