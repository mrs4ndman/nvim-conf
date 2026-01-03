return {
  -- 3.- Theme plugins config
  -- Remember previous colorscheme
  {
    "raddari/last-color.nvim",
    -- commit = "8df2c65343da403d0c738797817c5e6d1607fdbb",
  },
  {
    "mrs4ndman/kirbo", -- the coolest color scheme B)
    -- lazy = false,
    -- priority = 1000,
    enabled = true,
    lazy = false,
    dev = true,
    priority = 1000,
  },
  {
    "rose-pine/neovim", -- the coolest color scheme B)
    name = "rose-pine",
    -- lazy = false,
    -- priority = 1000,
    enabled = true,
    opts = {
      variant = "main",
      dark_variant = "main",
      bold_vert_split = true,
      disable_background = true,
      disable_float_background = false,
      disable_italics = true,
      highlight_groups = { NotifyBackground = { bg = "base" } },
    },
  },

  {
    "folke/tokyonight.nvim",
    -- lazy = false,
    -- priority = 1000,
    opts = {
      style = "night",
      light_style = "day",
      transparent = true,
      styles = {
        comments = { italic = true },
        keywords = { italic = true },
        functions = {},
        variables = {},
        sidebars = "dark",
        floats = "dark",
      },
      hide_inactive_statusline = false,
      dim_inactive = true,
      -- lualine_bold = true,
    },
  },
  {
    "tiagovla/tokyodark.nvim",
    opts = {
      transparent_background = true,
      styles = {
        comments = { italic = true },
        keywords = { italic = false },
        identifiers = { italic = false },
        functions = { italic = true },
        variables = { italic = false },
      },
      terminal_colors = true,
    },
  },
  {
    "projekt0n/github-nvim-theme",
    -- lazy = false,
    -- priority = 1000,
    config = function()
      require("github-theme").setup({
        options = {
          hide_end_of_buffer = true,
          dim_inactive = true,
          styles = {
            comments = "italic",
            keywords = "bold",
            types = "italic,bold",
          },
        },
      })
    end,
  },
  {
    "nyoom-engineering/oxocarbon.nvim",
    -- lazy = false,
    -- priority = 1000,
    config = function()
      vim.cmd("colorscheme oxocarbon")
      vim.opt.guicursor = ""
      vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    end,
  },
  {
    "wuelnerdotexe/vim-enfocado",
    -- lazy = false,
    -- priority = 1000,
    config = function()
      vim.g.enfocado_style = "neon"
    end,
  },
  {
    "maxmx03/fluoromachine.nvim",
    -- lazy = false,
    -- priority = 1000,
    config = function()
      require("fluoromachine").setup({
        glow = false,
        theme = "fluoromachine",
        transparent = true,
      })
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        background = { light = "latte", dark = "mocha" },
        transparent_background = true,
        integrations = {
          cmp = true,
          gitsigns = true,
          harpoon = true,
          lsp_trouble = true,
          leap = true,
          mason = true,
          mini = true,
          noice = true,
          notify = true,
          -- nvimtree = true,
          rainbow_delimiters = true,
          telescope = true,
          treesitter_context = true,
          treesitter = true,
          which_key = true,
        },
      })
      vim.opt.guicursor = ""
      vim.cmd([[augroup enfocado_customization
      autocmd!
      autocmd ColorScheme enfocado highlight Normal ctermbg=NONE guibg=NONE
      augroup END
      ]])
    end,
  },
}
