return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    {
      -- Customize or remove this keymap to your liking
      "<leader>ff",
      function()
        require("conform").format({ async = true, lsp_fallback = true })
        vim.print("Done :)")
      end,
      mode = { "n", "v" },
      desc = "Format buffer",
    },
  },
  opts = {
    -- Define your formatters
    formatters_by_ft = {
      lua = { "stylua" },

      rust = { "rustfmt" },
      java = { "clang-format" },

      javascript = { "prettierd" },
      astro = { "prettierd" },
      html = { "prettierd" },
      css = { "prettierd" },

      markdown = { "injected" },
      sql = { "sql_formatter" },
      xml = { "xmlformat" },
    },
  },
}
