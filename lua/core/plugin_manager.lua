-- Mr Sandman's .lua config for NVIM lazy.lua
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

vim.g.mapleader = " "
-- A little special key 😎
vim.g.maplocalleader = "ñ"

require("lazy").setup({
  spec = {
    { import = "plugins.custom" },
    { import = "plugins.movement" },
    { import = "plugins.treesitter" },
    { import = "plugins.lsp" },
    { import = "plugins.ui" },
    { import = "plugins.tools" },
    { import = "plugins.dap" },
    { import = "plugins.langs" },
    { import = "plugins.completion" },
    { import = "plugins.misc" },
  },
  defaults = { lazy = true, version = false },
  install = { colorscheme = { "tokyonight", "habamax" } },
  checker = { enabled = true, notify = false },
  change_detection = { notify = false },
  ui = { size = { width = 0.7, height = 0.7 }, wrap = true, border = "single" },
  dev = {
    path = "~/Gitchub/nvim-plugins",
    fallback = true,
  },
  performance = {
    cache = { enabled = true },
    rtp = {
      reset = true,
      disabled_plugins = {
        "gzip",
        "tarPlugin",
        -- "netrw",
        -- "netrwPlugin",
        -- "matchit",
        -- "matchparen",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
