return {
  "arminveres/md-pdf.nvim",
  branch = "main",
  lazy = true,
  keys = {
    { "<leader>pd", ":lua require('md-pdf').convert_md_to_pdf()<CR>", desc = "[PDF] Preview" },
  },
  config = true,
}
