require("balls").register({
  url = "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
  lazy = false,
})
require("lsp_lines").setup()
-- LSP_LINES TOGGLE
vim.keymap.set({ "n", "v" }, "<leader>vl", require("lsp_lines").toggle, { desc = "[LSP] Toggle extra line diagnostics" })
require("balls")
.register({ url = GH .. "williamboman/mason.nvim" })
require("balls")
.register({ url = GH .. "WhoIsSethDaniel/mason-tool-installer.nvim" })
:load_on({ "BufReadPre", "BufNewFile" }, {
  once = true,
  callback = function()
    require("mason").setup()
    require("mason-tool-installer").setup({
      ensure_installed = {
        -- Formatters
        "cbfmt",
        "shfmt",
        "stylua",
        "prettierd",
        "commitlint",
        "clang-format",
        -- DAP
        -- 'codelldb',
        "bash-debug-adapter",
        "debugpy",
        "delve",
        "go-debug-adapter",
        "java-debug-adapter",
        "js-debug-adapter",
        "php-debug-adapter",
        "debugpy",
        -- LSPs
        "lua-language-server",
        "vim-language-server",
        "html-lsp",
        "astro-language-server",
        "typescript-language-server",
        "css-lsp",
        "eslint-lsp",
        "intelephense",
        "ltex-ls",
        "marksman",
        "clangd",
        "neocmakelsp",
        "json-lsp",
        "python-lsp-server",
        "ruby-lsp",
        "bash-language-server",
        -- 'hls',
        "ansible-language-server",
        "dockerfile-language-server",
        "yaml-language-server",
        "ruff-lsp",
        "rust-analyzer",
        "gopls",
        "jdtls",
      },
      auto_update = true,
      debounce_hours = 2,
    })
  end
})

require("balls")
.register({ url = "https://github.com/neovim/nvim-lspconfig", lazy = true })
:load_on({ "BufRead", "BufEnter" } , {
  callback = function()
    require("custom.lsp.init").setup()
  end
})
