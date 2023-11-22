require("balls").register({ url = GH .. "mrs4ndman/nvim-cmp", lazy = false })
require("balls").register({ url = GH .. "hrsh7th/cmp-buffer", lazy = false })
require("balls").register({ url = GH .. "hrsh7th/cmp-cmdline", lazy = false })
require("balls").register({ url = GH .. "hrsh7th/cmp-path", lazy = false })
require("balls").register({ url = GH .. "hrsh7th/cmp-emoji", lazy = false })
require("balls").register({ url = GH .. "hrsh7th/cmp-nvim-lua", lazy = false })
require("balls").register({ url = GH .. "hrsh7th/cmp-nvim-lsp", lazy = false })
require("balls").register({ url = GH .. "petertriho/cmp-git", lazy = false })
require("balls").register({ url = GH .. "hrsh7th/cmp-nvim-lsp-document-symbol", lazy = false })
require("balls").register({ url = GH .. "hrsh7th/cmp-nvim-lsp-signature-help", lazy = false })
require("balls").register({ url = GH .. "hrsh7th/cmp-buffer", lazy = false })
require("balls").register({ url = GH .. "L3MON4D3/LuaSnip", lazy = false })
require("balls").register({ url = GH .. "onsails/lspkind.nvim", lazy = false })
require("balls").register({ url = GH .. "roobert/tailwindcss-colorizer-cmp.nvim", lazy = false })

--     "kdheepak/cmp-latex-symbols",
--     "hrsh7th/cmp-omni",
--     "f3fora/cmp-spell",
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

require("tailwindcss-colorizer-cmp").setup({
  color_square_width = 2,
})

require("custom.cmp").setup()

--     -- Icons
--     "onsails/lspkind.nvim",
--     {
--     },
--     {
--       "kristijanhusak/vim-dadbod-completion",
--       config = function()
--         vim.api.nvim_create_autocmd("FileType", {
--           pattern = { "sql", "mysql", "plsql" },
--           callback = function()
--             ---@diagnostic disable-next-line: undefined-field
--             require("cmp").setup.buffer({
--               sources = {
--                 { name = "vim-dadbod-completion" },
--                 { name = "luasnip" },
--                 { name = "buffer" },
--               },
--             })
--           end,
--         })
--       end,
--     },
--     "buschco/nvim-cmp-ts-tag-close",
--     "saadparwaiz1/cmp_luasnip",
--   },
--   main = "custom.cmp",
--   config = true
-- }
