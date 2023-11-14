local capabilities = require("custom.lsp.init").capabilities
local on_attach = require("custom.lsp.init").on_attach
local lspconfig = require("lspconfig")

local servers = {
  ["lua_ls"] = function()
    return {

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
          },
          hint = { enable = true },
        },
      },
    }
  end,

  -- Rusty boi
  ["rust_analyzer"] = function()
    return {
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        ["rust-analyzer"] = {
          diagnostics = {
            enable = true,
          },
        },
      },
    }
  end,

  -- Clangd for C / C++
  ["clangd"] = function()
    return {
      on_attach = on_attach,
      capabilities = capabilities,
    }
  end,

  -- Web Dev swag
  ["html"] = function()
    return {
      on_attach = on_attach,
      capabilities = capabilities,
    }
  end,
  -- lspconfig.eslint.setup({})
  ["tsserver"] = function()
    return {
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
    }
  end,
  ["cssls"] = function()
    return {
      on_attach = on_attach,
      capabilities = capabilities,
    }
  end,

  ["astro"] = function()
    return {
      on_attach = on_attach,
      capabilities = capabilities,
      init_options = {
        typescript = {
          tsdk = "node_modules/typescript/lib",
        },
      },
    }
  end,

  -- Pee-H-Pee
  ["intelephense"] = function()
    return {
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        intelephense = {
          environment = {
            shortOpenTag = true,
          },
        },
      },
    }
  end,

  -- SHHHHELLLL
  ["bashls"] = function()
    return {
      on_attach = on_attach,
      capabilities = capabilities,
    }
  end,

  -- Note-taking helper
  ["marksman"] = function()
    return {
      on_attach = on_attach,
      capabilities = capabilities,
    }
  end,

  ["texlab"] = function()
    return {
      on_attach = on_attach,
      capabilities = capabilities,
    }
  end,

  -- Good ole Vimscript
  ["vimls"] = function()
    return {
      on_attach = on_attach,
      capabilities = capabilities,
    }
  end,

  ["yamlls"] = function()
    return {
      on_attach = on_attach,
      capabilities = capabilities,
    }
  end,

  ["jsonls"] = function()
    return {
      on_attach = on_attach,
      capabilities = capabilities,
    }
  end,
  ["pylsp"] = function()
    return {
      on_attach = on_attach,
      capabilities = capabilities,
    }
  end,
  ["ocamlls"] = function()
    return {}
  end,
  ["neocmake"] = function()
    return {}
  end,
  ["ansiblels"] = function()
    return {}
  end,
  ["ruby_ls"] = function()
    return {}
  end,

  -- Not in use

  -- ["emmet_ls"] = function()
  --  return {}
  --  end,
  -- ["gopls"] = function()
  --   return {}
  -- end,
}

for server, setup in pairs(servers) do
  lspconfig[server].setup(setup())
end
