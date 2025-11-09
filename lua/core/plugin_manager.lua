-- Mr Sandman's .lua config for NVIM lazy.lua
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMSG" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    os.exit(1)
  end
end

vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "

-- A little special key 😎
vim.g.maplocalleader = "ñ"

require("lazy").setup({
  spec = {
    { import = "plugins.colorschemes" },
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
      disabled_plugins = {
        "gzip",
        "tarPlugin",
        "netrw",
        "netrwPlugin",
        -- "matchit",
        -- "matchparen",
        -- "tutor",
        "zipPlugin",
      },
    },
  },
})
