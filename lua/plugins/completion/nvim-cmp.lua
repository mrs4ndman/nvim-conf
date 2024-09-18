return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    -- Completion sources
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-emoji",
    "hrsh7th/cmp-nvim-lsp-signature-help",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-nvim-lsp-document-symbol",
    "hrsh7th/cmp-nvim-lsp",
    "petertriho/cmp-git",
    -- {
    -- BUG: Report omnifunc autotrigger to the repo
    --   "micangl/cmp-vimtex",
    --   ft = "tex",
    -- },
    -- "kdheepak/cmp-latex-symbols",
    "hrsh7th/cmp-omni",
    "f3fora/cmp-spell",
    -- Icons
    "onsails/lspkind.nvim",
    {
      "Exafunction/codeium.nvim",
      dependencies = "nvim-lua/plenary.nvim",
      enabled = false,
      config = true,
    },
    {
      "roobert/tailwindcss-colorizer-cmp.nvim",
      -- optionally, override the default options:
      config = function()
        require("tailwindcss-colorizer-cmp").setup({
          color_square_width = 2,
        })
      end,
    },
    {
      "kristijanhusak/vim-dadbod-completion",
      config = function()
        vim.api.nvim_create_autocmd("FileType", {
          pattern = { "sql", "mysql", "plsql" },
          callback = function()
            ---@diagnostic disable-next-line: undefined-field
            require("cmp").setup.buffer({
              sources = {
                { name = "vim-dadbod-completion" },
                { name = "luasnip" },
                { name = "buffer" },
              },
            })
          end,
        })
      end,
    },
    {
      "L3MON4D3/LuaSnip",
      build = vim.fn.has("win32") ~= 0 and "echo 'NOTE: jsregexp is optional, so not a big deal if it fails to build\n'; make install_jsregexp"
        or nil,
      dependencies = { "rafamadriz/friendly-snippets" },
      config = function(_, opts)
        if opts then
          require("luasnip").config.setup(opts)
        end
        vim.tbl_map(function(type)
          require("luasnip.loaders.from_" .. type).lazy_load()
        end, { "vscode", "snipmate", "lua" })
        require("luasnip.loaders.from_snipmate").load({ paths = "~/.config/nvim/snippets/" })
        require("luasnip").filetype_extend("typescript", { "tsdoc" })
        require("luasnip").filetype_extend("javascript", { "jsdoc" })
        require("luasnip").filetype_extend("lua", { "luadoc" })
        require("luasnip").filetype_extend("python", { "pydoc" })
        require("luasnip").filetype_extend("rust", { "rustdoc" })
        require("luasnip").filetype_extend("cs", { "csharpdoc" })
        require("luasnip").filetype_extend("java", { "javadoc" })
        require("luasnip").filetype_extend("c", { "cdoc" })
        require("luasnip").filetype_extend("cpp", { "cppdoc" })
        require("luasnip").filetype_extend("php", { "phpdoc" })
        require("luasnip").filetype_extend("kotlin", { "kdoc" })
        require("luasnip").filetype_extend("ruby", { "rdoc" })
        require("luasnip").filetype_extend("sh", { "shelldoc" })
      end,
    },
    "buschco/nvim-cmp-ts-tag-close",
    "saadparwaiz1/cmp_luasnip",
  },
  main = "plugins.configs.cmp",
  config = true
}
