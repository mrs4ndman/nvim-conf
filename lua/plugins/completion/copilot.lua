return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  keys = {
    {
      "<leader>ct",
      function()
        require("copilot.suggestion").toggle_auto_trigger()
        vim.print("Toggled auto trigger :)")
      end,
      mode = { "n", "v" },
      desc = "[Copilot] Toggle auto trigger",
    },
  },
  event = "InsertEnter",
  config = function()
    local cmp = require("cmp")
    require("copilot").setup({
      suggestion = {
        enabled = true,
        auto_trigger = true,
        debounce = 75,
        keymap = {
          accept = "<C-M-y>",
          next = "<C-M-n>",
          prev = "<C-M-p>",
          dismiss = "<C-M-e>",
          accept_word = false,
          accept_line = false,
        },
      },
    })
    cmp.event:on("menu_opened", function()
      vim.b.copilot_suggestion_hidden = true
    end)

    cmp.event:on("menu_closed", function()
      vim.b.copilot_suggestion_hidden = false
    end)
  end,
}
