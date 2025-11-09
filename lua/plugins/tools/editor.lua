return {
  { -- 9.- Autopairs & tabout for tabbing out of said pairs
    "windwp/nvim-autopairs",
    event = { "BufRead", "BufNewFile" },
    config = function()
      require("nvim-autopairs").setup({
        check_ts = true,
        -- { open = "¿", close = "?" },
      })
    end,
  },
  {
    "numToStr/Comment.nvim",
    event = { "BufRead", "BufNewFile" },
    config = function()
      require("Comment").setup({
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      })
    end,
  },
  {
    "kylechui/nvim-surround",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      keymaps = {
        normal = "ys",
        delete = "ds",
        visual = "S",
        visual_line = "gS",
        change = "cs",
        change_line = "cS",
      },
    },
  },
  {
    "nguyenvukhang/nvim-toggler",
    lazy = false,
    enabled = false,
    keys = {
      {
        mode = { "n", "v" },
        "<leader>dt",
        function()
          require("nvim-toggler").toggle()
        end,
        desc = "Toggle word",
      },
    },
    opts = {
      inverses = {
        ["true"] = "false",
        ["TRUE"] = "FALSE",
        ["True"] = "False",
        ["yes"] = "no",
        ["on"] = "off",
        ["left"] = "right",
        ["up"] = "down",
        ["public"] = "private",
        -- ["!="] = "==",
        ["!"] = "=",
        ["->"] = "<-",
        ["?"] = "¿",
        ["<"] = ">",
        ["[x]"] = "[ ]",
        ["enabled"] = "disabled",
        ["enable"] = "disable",
        ["active"] = "inactive",
        ["beep"] = "boop",
        ["emacs"] = "poopoo",
        ["nvim"] = "GigaChad",
        ["Visual Studio Code"] = "poopoo",
      },
      remove_default_keybinds = true,
      remove_default_inverses = true,
    },
  },
}
