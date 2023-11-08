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

-- Markdown and LaTeX settings
vim.api.nvim_create_autocmd("Filetype", {
  pattern = "markdown",
  callback = function()
    vim.cmd([[setlocal wrap linebreak]])
    vim.keymap.set("n", "j", "gj")
    vim.keymap.set("n", "k", "gk")
  end,
})

vim.api.nvim_create_autocmd("Filetype", {
  pattern = "alpha",
  callback = function()
    vim.b.miniindentscope_disable = true
  end
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

local statuslineNop = {
  "netrw",
  "alpha",
  "lazy",
}
vim.api.nvim_create_autocmd({ "BufAdd", "BufEnter", "BufRead", "BufLeave", "WinLeave", "WinNew", "WinClosed", "WinNew" }, {
  callback = function()
    if vim.bo.filetype ~= statuslineNop then
      vim.cmd([[setlocal laststatus=3]])
      -- vim.api.nvim_get_option_value("filetype", { 0 })
    end
    if vim.bo.filetype == statuslineNop then
      vim.cmd([[setlocal laststatus=0]])
    end
  end,
})

vim.api.nvim_create_autocmd("Filetype", {
  pattern = statuslineNop,
  callback = function()
    vim.cmd([[setlocal laststatus=0]])
  end,
})

-- Might give this a shot at some point
-- vim.api.nvim_create_autocmd("Filetype", {
--   pattern = { "lua", "html", "css" },
--   callback = function()
--     vim.bo.tabstop = 2
--     vim.bo.shiftwidth = 2
--     vim.bo.softtabstop = 2
--     vim.bo.expandtab = true
--   end,
-- })

-- Fix for :Telescope oldfiles leaving me in insert mode
vim.api.nvim_create_autocmd("WinLeave", {
  callback = function()
    if vim.bo.ft == "TelescopePrompt" and vim.fn.mode() == "i" then
      vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "i", false)
    end
  end,
})

-- Highlight yanking action for a second
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank({ timeout = 60 })
  end,
})

-- Create Registry cleaner
local function ClearReg()
  print("Clearing registers")
  vim.cmd([[
    let regs=split('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-"', '\zs')
    for r in regs
    call setreg(r, [])
    endfor
    ]])
end

-- Clearing the registers?
vim.api.nvim_create_user_command("ClearReg", function()
  ClearReg()
end, {})
vim.keymap.set("n", "<leader>cr", "<cmd>ClearReg<CR>", { desc = "Clear registers" })