Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "obsidian.nvim"

return {
  "epwalsh/" .. plugin,
  enabled = Is_Enabled(plugin),
  lazy = true,
  event = {
    "BufReadPre " .. vim.fn.expand "~" .. "/notes/HS-1-Doble/**.md",
    "BufReadPre " .. vim.fn.expand "~" .. "/Documents/Obsidian Vaults/**.md",
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "mrs4ndman/nvim-cmp",
    "nvim-telescope/telescope.nvim",
  },
  opts = {
    workspaces = {
      {
        name = "hs",
        path = "~/notes/HS-1-Doble"
      },
      {
        name = "personal",
        path = "~/Documents/Obsidian Vaults"
      }
    },
    completion = {
      nvim_cmp = true,
      min_chars = 2,
      new_notes_location = "current_dir",
    },
    mappings = {
      ["gf"] = {
        action = function()
          return require("obsidian").util.gf_passthrough()
        end,
        opts = { noremap = false, expr = true, buffer = true },
      }
    },
    follow_url_func = function(url)
      vim.fn.jobstart({"xdg-open", url})
    end,
    open_app_foreground = true,
    finder = "telescope.nvim",
    open_notes_in = "current",
  },
  config = function(_, opts)
    require("obsidian").setup(opts)
  end,
}
