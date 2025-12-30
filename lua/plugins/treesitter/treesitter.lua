return {
  {
    "nvim-treesitter/nvim-treesitter", -- parsing to the end of time
    lazy = false,
    branch = "main",
    build = function()
      vim.cmd("TSUpdate")
    end,
    -- dependencies = {
    --   { "David-Kunz/markid" },
    -- },
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
      -- sync_install = false,
      -- highlight = {
      --   enable = true,
      --   additional_vim_regex_highlighting = { "markdown" },
      -- markid = { enable = true },

      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("mrsandman.tree-sitter", { clear = true }),
        callback = function(event)
          local ok, treesitter = pcall(require, "nvim-treesitter")
          if ok and vim.tbl_contains(treesitter.get_installed(), event.match) then
            vim.treesitter.start(event.buf, event.match)
          end
        end,
      })
    end,
  },
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    opts = {
      enable_autocmd = false,
    },
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = { "BufReadPost" },
    -- cmd = "TSContext Toggle",
    keys = {
      { "<leader>tct", "<cmd>TSContext toggle<CR>", desc = "TS Context Toggle" },
    },
    opts = { mode = "cursor" },
  },
  {
    "windwp/nvim-ts-autotag",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      opts = {
        enable_close = true,
        enable_rename = true,
        enable_close_on_slash = true,
      },
    },
  },
}
