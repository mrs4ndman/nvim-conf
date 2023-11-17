Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "alpha-nvim"

if Is_Enabled(plugin) then
  vim.keymap.set("n", "<leader>sp", "<cmd>Alpha<CR>", { desc = "Toggle Alpha", silent = true })
end

return {
  "goolord/" .. plugin,
  -- event = "VimEnter",
  -- dependencies = "nvim-tree/nvim-web-devicons",
  enabled = Is_Enabled(plugin),
  lazy = false,
  priority = 1000,
  opts = function(_, opts)
    if Use_Defaults(plugin) then
      opts = opts
    else
      opts = opts.dashboard
    end
  end,
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")
    -- It uses almost the same format as the "date" command in Linux (man date for info)
    local time = os.date("%_k:%M - %a - %b %d")
    local lazy = require("lazy")

    if vim.o.filetype == "lazy" then
      vim.cmd.close()
      vim.api.nvim_create_autocmd("User", {
        pattern = "AlphaReady",
        callback = function()
          lazy.show()
        end,
      })
    end

    vim.api.nvim_create_autocmd("User", {
      pattern = "LazyVimStarted",
      callback = function()
        local stats = lazy.stats()
        local v = vim.version()
        local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
        dashboard.section.footer.val = {
          -- "",
          -- "",
          "",
          "        " .. time .. " |   v" .. v.major .. "." .. v.minor .. "." .. v.patch,
          "",
          "   " .. stats.loaded .. " / " .. stats.count .. " plugins | " .. ms .. "ms |  mrs4ndman",
          "",
          "󰽰 The phone is ringing, the world is spinning 󰽰",
          "               󰎈 Just let me out 󰎈",
          -- "   󰽰 I tuck you in, warm within, keep you free from sin ... 󰽰",
          -- "                 󰎈 'Til the Sandman, he comes 󰎈              ",
          "",
          "",
          "",
        }
        pcall(vim.cmd.AlphaRedraw)
      end,
    })

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
      dashboard.button("c", "󰏘    Colorschemes", ":Themer<CR>"),
      dashboard.button("l", "󰒲    Plugins", ":Lazy<CR>"),
      dashboard.button("q", "󰿅    Get me out :D", ":qa<CR>"),
    }

    alpha.setup(dashboard.opts)
    -- end
  end,
}
