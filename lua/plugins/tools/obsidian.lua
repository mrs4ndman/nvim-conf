return {
  "epwalsh/obsidian.nvim",
  event = {
    "BufReadPre " .. vim.fn.expand("~") .. "/notes/HS-1-Doble/**.md",
    "BufReadPre " .. vim.fn.expand("~") .. "/Documents/Obsidian Vaults/**.md",
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "hrsh7th/nvim-cmp",
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    require("obsidian").setup({
      workspaces = {
        {
          name = "hs",
          path = "~/notes/HS-1-Doble",
        },
        {
          name = "personal",
          path = "~/Documents/Obsidian Vaults",
        },
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
        },
      },
      follow_url_func = function(url)
        vim.fn.jobstart({ "xdg-open", url })
      end,
      open_app_foreground = true,
      finder = "telescope.nvim",
      open_notes_in = "current",
    })
  end,
}
