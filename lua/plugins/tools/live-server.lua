return {
  "barrett-ruth/live-server.nvim",
  cmd = { "LiveServerStart", "LiveServerRestart", "LiveServerStop" },
  keys = {
    { "<leader>ls", "<cmd>LiveServerStart<CR>", desc = "[Live-Server] Start" },
    { "<leader>lr", "<cmd>LiveServerRestart<CR>", desc = "[Live-Server] Restart" },
    { "<leader>lq", "<cmd>LiveServerStop<CR>",  desc = "[Live-Server] Stop" },
  },
  config = function()
    require("live-server").setup({
      port = 8080,
      browser_command = "firefox",
      quiet = true,
    })
  end,
}
