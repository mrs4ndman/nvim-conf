return {
  -- HTML Preview
  -- {
  --   "Diogo-ss/five-server.nvim",
  --   cmd = { "FiveServer" },
  --   keys = {
  --     { "<leader>ls", "<cmd>FiveServer start<CR>", desc = "[Live-Server] Start" },
  --     { "<leader>li", "<cmd>FiveServer install<CR>", desc = "[Live-Server] Restart" },
  --     { "<leader>lq", "<cmd>FiveServer stop<CR>", desc = "[Live-Server] Stop" },
  --   },
  --   build = function()
  --     require("fs.utils.install")()
  --   end,
  --   opts = {
  --     notify = true,
  --     -- add other options
  --   },
  --   config = function(_, opts)
  --     require("fs").setup(opts)
  --   end,
  -- },
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
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
    keys = {
      { "<leader>md", "<cmd>MarkdownPreviewToggle<CR>", desc = "Toggle MD preview" },
    },
  },
}
