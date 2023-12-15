return {
  -- HTML Preview
  {
    "barrett-ruth/live-server.nvim",
    cmd = { "LiveServerStart", "LiveServerRestart", "LiveServerStop" },
    keys = {
      { "<leader>ls", "<cmd>LiveServerStart<CR>", desc = "[Live-Server] Start" },
      { "<leader>lr", "<cmd>LiveServerRestart<CR>", desc = "[Live-Server] Restart" },
      { "<leader>lq", "<cmd>LiveServerStop<CR>", desc = "[Live-Server] Stop" },
    },
    config = function()
      require("live-server").setup({
        port = 8080,
        browser_command = "firefox",
        quiet = true,
      })
    end,
  },
  -- MD to PDF
  {
    "arminveres/md-pdf.nvim",
    branch = "main",
    lazy = true,
    keys = {
      { "<leader>pd", ":lua require('md-pdf').convert_md_to_pdf()<CR>", desc = "[PDF] Preview" },
    },
    config = true,
  },
  -- MD to HTML
  {
    "davidgranstrom/nvim-markdown-preview",
    cmd = { "MarkdownPreview" },
    ft = { "markdown" },
    keys = {
      { "<leader>md", "<cmd>MarkdownPreview<CR>", desc = "Toggle MD preview" },
    },
    config = function()
      vim.g.nvim_markdown_preview_theme = "github"
    end,
  },
}
