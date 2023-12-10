-- Neovim Core Config
vim.loader.enable() -- Experimental loader for Lua
require("core")

-- Custom plugin configs that load after most things
require("custom")
