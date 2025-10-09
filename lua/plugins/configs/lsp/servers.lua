local capabilities = require("plugins.configs.lsp.init").capabilities
local on_attach = require("plugins.configs.lsp.init").on_attach

local servers = {
  ["lua_ls"] = {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim" },
        },
        workspace = {
          library = {
            vim.env.VIMRUNTIME,
            vim.fn.stdpath("config") .. "/lua",
            vim.api.nvim_get_runtime_file("", true),
          },
          maxPreload = 1000,
          preloadFileSize = 1000,
          checkThirdParty = false,
        },
        runtime = {
          version = "LuaJIT",
          pathStrict = true,
          path = {
            "lua/?.lua",
            "lua/?/init.lua",
          },
        },
        hint = { enable = true },
      },
    },
  },

  -- Rusty boi
  ["rust_analyzer"] = {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
      ["rust-analyzer"] = {
        diagnostics = {
          enable = true,
        },
      },
    },
  },

  -- Clangd for C / C++
  ["clangd"] = {
    on_attach = on_attach,
    capabilities = capabilities,
  },

  -- Web Dev swag
  ["html"] = {
    on_attach = on_attach,
    capabilities = capabilities,
  },
  -- lspconfig.eslint.setup({})
  ["ts_ls"] = {
    on_attach = on_attach,
    capabilities = capabilities,
    -- javascript = {
    --   inlayHints = {
    --     includeInlayEnumMemberValueHints = true,
    --     includeInlayFunctionLikeReturnTypeHints = true,
    --     includeInlayFunctionParameterTypeHints = true,
    --     includeInlayParameterNameHints = 'all',
    --     includeInlayParameterNameHintsWhenArgumentMatchesName = true,
    --     includeInlayPropertyDeclarationTypeHints = true,
    --     includeInlayVariableTypeHints = true,
    --   },
    -- },
    -- typescript = {
    --   inlayHints = {
    --     includeInlayEnumMemberValueHints = true,
    --     includeInlayFunctionLikeReturnTypeHints = true,
    --     includeInlayFunctionParameterTypeHints = true,
    --     includeInlayParameterNameHints = 'all',
    --     includeInlayParameterNameHintsWhenArgumentMatchesName = true,
    --     includeInlayPropertyDeclarationTypeHints = true,
    --     includeInlayVariableTypeHints = true,
    --   },
    -- },
  },
  ["cssls"] = {
    on_attach = on_attach,
    capabilities = capabilities,
  },

  ["astro"] = {
    on_attach = on_attach,
    capabilities = capabilities,
    init_options = {
      typescript = {
        tsdk = "node_modules/typescript/lib",
      },
    },
  },

  -- Pee-H-Pee
  ["intelephense"] = {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
      intelephense = {
        environment = {
          shortOpenTag = true,
        },
      },
    },
  },

  -- SHHHHELLLL
  ["bashls"] = {
    on_attach = on_attach,
    capabilities = capabilities,
  },

  -- Note-taking helper
  ["marksman"] = {
    on_attach = on_attach,
    capabilities = capabilities,
  },

  ["texlab"] = {
    on_attach = on_attach,
    capabilities = capabilities,
  },

  -- Good ole Vimscript
  ["vimls"] = {
    on_attach = on_attach,
    capabilities = capabilities,
  },

  ["yamlls"] = {
    on_attach = on_attach,
    capabilities = capabilities,
  },


  ["jsonls"] = {
    on_attach = on_attach,
    capabilities = capabilities,
  },
  ["pylsp"] = {
    on_attach = on_attach,
    capabilities = capabilities,
  },


  -- Not in use

  --[[ 
  ["lemminx"] = {
    on_attach = on_attach,
    capabilities = capabilities,
  },
  ["ocamlls"] = {},
  ["neocmake"] = {},
  ["ansiblels"] = {},
  ["ruby_ls"] = {},
  ["emmet_ls"] = {},
  ["gopls"] = {}, 
  ]]
}

for server, setup in pairs(servers) do
  vim.lsp.enable(server)
  vim.lsp.config(server, setup)
end
