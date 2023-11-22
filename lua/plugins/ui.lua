require("balls").register({
  url = GH .. "goolord/alpha-nvim",
  lazy = false,
})
local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")
-- It uses almost the same format as the "date" command in Linux (man date for info)
local time = os.date("%_k:%M - %a - %b %d")

local v = vim.version()
dashboard.section.footer.val = {
  -- "",
  -- "",
  "",
  "        " .. time .. " |   v" .. v.major .. "." .. v.minor .. "." .. v.patch,
  "",
  "             30 plugins |  mrs4ndman",
  "",
  "󰽰 The phone is ringing, the world is spinning 󰽰",
  "               󰎈 Just let me out 󰎈",
  -- "   󰽰 I tuck you in, warm within, keep you free from sin ... 󰽰",
  -- "                 󰎈 'Til the Sandman, he comes 󰎈              ",
  "",
  "",
  "",
}

-- if vim.cmd.echo"argc()" == "0" then
-- Header section config
dashboard.section.header.val = {
  "                                                                                    ",
  " ███╗   ███╗██████╗ ███████╗ █████╗ ███╗   ██╗██████╗ ███╗   ███╗ █████╗ ███╗   ██╗ ",
  " ████╗ ████║██╔══██╗██╔════╝██╔══██╗████╗  ██║██╔══██╗████╗ ████║██╔══██╗████╗  ██║ ",
  " ██╔████╔██║██████╔╝███████╗███████║██╔██╗ ██║██║  ██║██╔████╔██║███████║██╔██╗ ██║ ",
  " ██║╚██╔╝██║██╔══██╗╚════██║██╔══██║██║╚██╗██║██║  ██║██║╚██╔╝██║██╔══██║██║╚██╗██║ ",
  " ██║ ╚═╝ ██║██║  ██║███████║██║  ██║██║ ╚████║██████╔╝██║ ╚═╝ ██║██║  ██║██║ ╚████║ ",
  " ╚═╝     ╚═╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═════╝ ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝ ",
  "                                                                                    ",
  "                                   N E O V I M                                      ",
  "                                                                                    ",
  "                                      ／|__                                         ",
  "                                     (o o /                                         ",
  "_____________________________________ |.   ~. _____________________________________ ",
  "                                      じしf_,)ノ                                    ",
  -- "                                                                                    ",
}

dashboard.section.buttons.val = {
  dashboard.button("n", "    New file", "<cmd>ene<CR>"),
  dashboard.button("o", "⚡   It's Oil time", ":Oil<CR>"),
  dashboard.button("v", "    Source session", ":SessionRestore<CR>"),
  dashboard.button("f", "󰈞    Find project file", ":Telescope find_files<CR>"),
  dashboard.button("r", "    Recent", ":Telescope oldfiles<CR>"),
  dashboard.button("g", "󰊄    Grep pattern", ":Telescope live_grep<CR>"),
  -- dashboard.button("l", "󰒲    Plugins", ":BallsList<CR>"),
  dashboard.button("q", "󰿅    Get me out :D", ":qa<CR>"),
}

alpha.setup(dashboard.opts)
vim.keymap.set("n", "<leader>sp", "<cmd>Alpha<CR>", { desc = "Toggle Alpha", silent = true })
-- end
