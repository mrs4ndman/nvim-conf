return {
  "nvim-treesitter/nvim-treesitter-textobjects",
  event = { "BufRead", "BufNewFile" },
  branch = "main",
  config = function()
    require("nvim-treesitter-textobjects").setup({
      select = {
        lookahead = true,
        include_surrounding_whitespace = true,
      },
    })
    vim.keymap.set({ "x", "o" }, "af", function()
      require("nvim-treesitter-textobjects.select").select_textobject("@function.outer", "textobjects")
    end, { desc = "Around the function" })
    vim.keymap.set({ "x", "o" }, "if", function()
      require("nvim-treesitter-textobjects.select").select_textobject("@function.inner", "textobjects")
    end, { desc = "Inside the function" })
    vim.keymap.set({ "x", "o" }, "ac", function()
      require("nvim-treesitter-textobjects.select").select_textobject("@class.outer", "textobjects")
    end, { desc = "Around the class" })
    vim.keymap.set({ "x", "o" }, "ic", function()
      require("nvim-treesitter-textobjects.select").select_textobject("@class.inner", "textobjects")
    end, { desc = "Inside the class" })
    vim.keymap.set({ "x", "o" }, "aI", function()
      require("nvim-treesitter-textobjects.select").select_textobject("@conditional.outer", "textobjects")
    end, { desc = "Around the conditional" })
    vim.keymap.set({ "x", "o" }, "iI", function()
      require("nvim-treesitter-textobjects.select").select_textobject("@conditional.inner", "textobjects")
    end, { desc = "Inside the conditional" })
    vim.keymap.set({ "x", "o" }, "aL", function()
      require("nvim-treesitter-textobjects.select").select_textobject("@loop.outer", "textobjects")
    end, { desc = "Around the loop" })
    vim.keymap.set({ "x", "o" }, "iL", function()
      require("nvim-treesitter-textobjects.select").select_textobject("@loop.inner", "textobjects")
    end, { desc = "Inside the loop" })
    vim.keymap.set({ "x", "o" }, "aC", function()
      require("nvim-treesitter-textobjects.select").select_textobject("@comment.outer", "textobjects")
    end, { desc = "Around the comment" })
    vim.keymap.set({ "x", "o" }, "iC", function()
      require("nvim-treesitter-textobjects.select").select_textobject("@comment.inner", "textobjects")
    end, { desc = "Inside the comment" })
    vim.keymap.set({ "x", "o" }, "as", function()
      require("nvim-treesitter-textobjects.select").select_textobject("@scope", "Language scope")
    end)
  end,
}
