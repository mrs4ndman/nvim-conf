return {
  "ThePrimeagen/refactoring.nvim",
  keys = { { "<leader>rr", desc = "[Refactor] Select refactoring" } },
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("refactoring").setup({
      prompt_func_return_type = {
        go = true,
        cpp = true,
        c = true,
        java = true,
      },
      prompt_func_param_type = {
        go = true,
        cpp = true,
        c = true,
        java = true,
      },
    })
    vim.keymap.set({ "n", "x" }, "<leader>rr", function()
      require("refactoring").select_refactor()
    end)
  end,
}
