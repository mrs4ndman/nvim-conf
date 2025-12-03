return {
  "nvim-treesitter/nvim-treesitter", -- parsing to the end of time
  lazy = false,
  branch = "main",
  build = function()
    vim.cmd("TSUpdate")
  end,
  dependencies = {
    {
      "nvim-treesitter/nvim-treesitter-context",
      keys = {
        { "<leader>tct", "<cmd>TSContext toggle<CR>", desc = "TS Context Toggle" },
      },
    },
    {
      "JoosepAlviste/nvim-ts-context-commentstring",
      opts = {
        enable_autocmd = false,
      },
    },
    "windwp/nvim-ts-autotag",
    -- { "David-Kunz/markid" }, --- TODO: FIX IN THE FUTURE
  },
  config = function()
    require("nvim-treesitter").install({
      "astro",
      "bash",
      "bibtex",
      "c",
      "cpp",
      "css",
      "gitcommit",
      "gitignore",
      "go",
      "html",
      "java",
      "javascript",
      "json",
      -- "latex",
      "lua",
      "luadoc",
      "markdown",
      "markdown_inline",
      "php",
      "python",
      "query",
      "regex",
      "rust",
      "sql",
      "ssh_config",
      "toml",
      "tsx",
      "typescript",
      "vim",
      "vimdoc",
      "yaml",
    })

    require("nvim-treesitter").setup({
      sync_install = false,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = { "markdown " },
      },
      indent = { enable = true },
      autotag = { enable = true },
      autopairs = { enable = true },
      -- markid = { enable = true }, -- TODO: FIX IN THE FUTURE
    })
  end,
}
