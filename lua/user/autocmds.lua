-- AUTOCMDS for various things
-- Correct syntax highlighting inside netrw
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    if vim.bo.filetype == "netrw" then
      vim.cmd([[setlocal syntax=netrw]])
    end
  end,
})

vim.api.nvim_create_autocmd("TermOpen", {
  callback = function()
    vim.opt.number = false
    vim.opt.relativenumber = false
    vim.cmd([[startinsert]])
  end,
})

vim.api.nvim_create_autocmd("Filetype", {
  pattern = "alpha",
  callback = function()
    vim.b.miniindentscope_disable = true
  end,
})

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*.tex",
  callback = function()
    vim.bo.filetype = "tex"
  end,
})

-- PSeInt settings
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*.psc",
  callback = function()
    vim.cmd([[setlocal filetype=pseint]])
  end,
})

-- Fix for :Telescope oldfiles leaving me in insert mode
-- vim.api.nvim_create_autocmd("WinLeave", {
--   callback = function()
--     if vim.bo.ft == "TelescopePrompt" and vim.fn.mode() == "i" then
--       vim.cmd.stopinsert()
--     end
--   end,
-- })

-- Highlight yanking action for a second
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank({ timeout = 60 })
  end,
})


-- A pair for simple notifying when recording macros
-- vim.api.nvim_create_autocmd("RecordingEnter", {
--   callback = function()
--     vim.notify("Macro recording started", vim.log.levels.INFO, {})
--   end,
-- })
-- vim.api.nvim_create_autocmd("RecordingLeave", {
--   callback = function()
--     vim.notify("Macro recording stopped", vim.log.levels.INFO, {})
--   end,
-- })
