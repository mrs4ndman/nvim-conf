-- MrSandman config - A mix of ThePrimeagen's + LazyVim + a bit of my own
-- Which-key plugin manages per-plugin keybinds on each plugin's config files

-- Key thing: Mapleader as Space

vim.g.mapleader = " "
vim.g.maplocalleader = "ñ"

local func = require("core.functions")
local icons = require("core.icons")

-- Lazy and Mason shortcuts
vim.keymap.set("n", "<leader>lz", "<cmd>Lazy<CR>", { desc = "Lazy" })
vim.keymap.set("n", "<leader>mp", "<cmd>Mason<CR>", { desc = "Mason" })

vim.keymap.set("n", "<leader>sb", function()
  require("telescope.builtin").live_grep({ search_dirs = { vim.api.nvim_buf_get_name(0) } })
end, { desc = "[🔭] Search current buffer" })

-- INTERNAL KEYBINDS
-- NORMAL mode Keybinds

-- Source current config file
vim.keymap.set("n", "<leader><leader>", function()
  if vim.bo.filetype ~= "lua" then
    print("Not a Lua file")
    return
  end
  print("Sourced :)")
  vim.cmd("so")
end, { desc = icons.misc.langs.lua .. " → Source current file" })

-- Clear notifications and search
vim.keymap.set("n", "<Esc>", function()
  require("notify").dismiss()
  vim.cmd("Noice dismiss")
  vim.cmd("nohl")
end)

-- Netrw keybind
-- vim.keymap.set("n", "<leader>E", vim.cmd.Ex, { desc = "Ex" })

-- Window splits
vim.keymap.set("n", "<leader>wh", "<cmd>split<CR>", { desc = "Horizontal split" })
vim.keymap.set("n", "<leader>wv", "<cmd>vsplit<CR>", { desc = "Vertical split" })
vim.keymap.set("n", "<A-Left>", "<cmd>vertical resize -2<CR>", { desc = "Make vertical split smaller" })
vim.keymap.set("n", "<A-Right>", "<cmd>vertical resize +2<CR>", { desc = "Make vertical split larger" })
vim.keymap.set("n", "<A-Up>", "<cmd>resize -2<CR>", { desc = "Make horizontal split smaller" })
vim.keymap.set("n", "<A-Down>", "<cmd>resize +2<CR>", { desc = "Make horizontal split larger" })
for i = 1, 10 do
  vim.keymap.set("n", "<M-" .. i .. ">", function()
    func.navigate(i)
  end)
end

-- Get me out of here (:D)
vim.keymap.set("n", "<leader><Esc>", "<cmd>quitall<CR>", { desc = "Quit all" })
vim.keymap.set("n", "<leader>ww", "<cmd>write<CR>", { desc = "Write current buffer" })
vim.keymap.set("n", "<leader>wa", "<cmd>write<CR>", { desc = "Write to all buffers" })
vim.keymap.set("n", "<leader>wq", "<cmd>wqa<CR>", { desc = "Bye :D" })
vim.keymap.set("n", "ZE", "<cmd>confirm qall<CR>")

-- Substitutor for current word
vim.keymap.set("n", "<C-s>", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gIc<Left><Left><Left><Left>]])

-- indent machine
vim.keymap.set("n", "<leader>ip", "=ap", { desc = "Indent a paragraph" })

-- Set files to be executable
vim.keymap.set("n", "<leader>cx", "<cmd>!chmod +x %<CR>", { desc = "Make file executable" })

vim.keymap.set({ "n", "v" }, "<leader>dd", [["_d]], { desc = "Better delete" })

-- Enable custom mappings for 1-9 yank-paste-delete registers
local alphabet = "abcefghijklmnopqrstuvwxz"

for i = 1, #alphabet do
  local letter = alphabet:sub(i, i)
  vim.keymap.set({ "n", "v" }, ("<leader>y%s"):format(letter), ([["%sy]]):format(letter), { desc = ("%s"):format(letter) .. " register yank" })
end

-- smart blackhole deletion
vim.keymap.set("n", "dd", function()
  ---@diagnostic disable-next-line: param-type-mismatch
  if vim.fn.getline(".") == "" then
    return '"_dd'
  end
  return "dd"
end, { expr = true })

vim.keymap.set("v", "D", function()
  ---@diagnostic disable-next-line: unused-local
  local l, c = unpack(vim.api.nvim_win_get_cursor(0))
  for _, line in ipairs(vim.api.nvim_buf_get_lines(0, l - 1, l, true)) do
    if line:match("^%s*$") then
      return '"_d'
    end
  end
  return "d"
end, { desc = "Visual smart d", expr = true })

-- Yank only to nvim clipboard
vim.keymap.set({ "n", "v" }, "<leader>yy", [[""y]])
vim.keymap.set({ "n", "v" }, "<leader>pp", [[""p]])

-- Appending line below to current line ("lil J")
vim.keymap.set("n", "J", "mzJ'z")

-- Keeping my cursor in the middle when searching
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Center cursor when skipping blocks and spaces
vim.keymap.set("n", "{", "{zzzv")
vim.keymap.set("n", "}", "}zzzv")
vim.keymap.set("n", "(", "(zzzv")
vim.keymap.set("n", ")", ")zzzv")

-- "S" functionality remap for Leap functionality
vim.keymap.set("n", "+", "S")
vim.keymap.set("v", "+", "s")

-- Delete character without yanking
vim.keymap.set({ "n", "v" }, "x", '"_x')
vim.keymap.set({ "n", "v" }, "X", '"_X')

-- Select all
vim.keymap.set("n", "<leader>sa", "ggVG", { desc = "Select all" })

-- Yank whole buffer
vim.keymap.set("n", "<leader>ya", 'ggVG"+y', { desc = "Yank whole buffer" })

-- Insert new line above and below and exit
-- vim.keymap.set("n", "<leader>o", "o<Esc>", {desc = "Insert new line below and exit" })
vim.keymap.set("n", "<leader>O", "O<Esc>", { desc = "Insert new line above and exit" })
vim.keymap.set("i", "<C-p>", "<Esc><cmd>Telescope oldfiles<CR>")

-- Buffer previous, next and close, window closing too
-- To use without the cokeline bar
-- This gave too many troubles with the Tab == <C-i> encoding
-- vim.keymap.set("n", "<Tab>", "<cmd>bnext<CR>", {desc = "Previous buffer" })
-- vim.keymap.set("n", "<S-Tab>", "<cmd>bprevious<CR>", {desc = "Previous buffer" })

-- Delete buffer without saving
vim.keymap.set("n", "<leader>bd", "<cmd>bd!<CR>", { desc = "Force buffer close" })
vim.keymap.set("n", "<leader>bc", "<cmd>bd<CR>", { desc = "Close buffer softly" })
vim.keymap.set("n", "<leader>q", "<cmd>close<CR>", { desc = "Close window the other way" })

local end_strings = {
  ";",
  ",",
  ":",
  ".",
  ")",
  "}",
  "]",
  "\\",
}
for _, char in ipairs(end_strings) do
  vim.keymap.set("n", "<leader>" .. char, function()
    func.put_at_end(char)
  end, { desc = "Put " .. char .. " at the end of the line" })
end

vim.keymap.set("n", "<leader>-", function()
  func.put_at_beginning("- ")
end, { desc = "Put - at the beginning of the line" })
vim.keymap.set("n", "<leader>*", function()
  func.put_at_beginning("* ")
end, { desc = "Put * at the beginning of the line" })
vim.keymap.set("n", "<leader>pc", function()
  func.put_at_beginning("* [ ]")
end, { desc = "Put * [ ] at the beginning of the line" })

vim.keymap.set("n", "<leader>→", function()
  func.put_at_end(" →")
end, { desc = "Put → at the end of the line" })
vim.keymap.set("n", "<leader>↓", function()
  func.put_at_end(" ↓")
end, { desc = "Put ↓ at the end of the line" })

-- Toggle relative linenumbers on and off
vim.keymap.set({ "n", "v" }, "<leader>tn", function()
  vim.o.relativenumber = not vim.o.relativenumber
end, { desc = "Toggle relative line numbers" })

-- Select harpoon file
vim.keymap.set("n", "<leader>H", function()
  func.harpoon_split()
end, { desc = "[Harpoon] Single picker" })

-- Run code
vim.keymap.set("n", "<leader>R", function()
  func.runner(20)
end, { desc = icons.misc.terminal .. "→ Code runner" })

-- Incredible markdown codeblocks:
vim.keymap.set("n", "<leader>C", function()
  func.md_block()
end, { desc = icons.misc.langs.markdown .. "→ Codeblock creator" })

-- Mover caracteres desde normal
vim.keymap.set("n", "<C-M-h>", function()
  func.swap_char_b()
end)

vim.keymap.set("n", "<C-M-l>", function()
  func.swap_char_f()
end)

vim.keymap.set("n", "<C-M-a>", function()
  func.increase_header()
end)
vim.keymap.set("n", "<C-M-x>", function()
  func.decrease_header()
end)

vim.keymap.set("n", "<leader>tC", "rx")

-- Half-page jumping
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "]s", "]szz")
vim.keymap.set("n", "[s", "[szz")

-- Lazy terminal
vim.keymap.set("n", "<M-C-j>", function()
  require("lazy.util").float_term()
end, {})

-- Normal mode ALT keybinds
-- Sidescrolling: Go-Go-Gadget :D
vim.keymap.set("", "<ScrollWheelLeft>", "<Nop>")
vim.keymap.set("", "<ScrollWheelRight>", "<Nop>")
vim.keymap.set("n", "<C-h>", "2<ScrollWheelLeft>")
vim.keymap.set("n", "<C-l>", "2<ScrollWheelRight>")

-- Move up and down in normal mode
vim.keymap.set("n", "<C-j>", ":m .+1<CR>==", { silent = true })
vim.keymap.set("n", "<C-k>", ":m .-2<CR>==", { silent = true })

-- No plz
vim.keymap.set("n", "<C-z>", "<Nop>")

-- INSERT mode Keybinds

-- How to escape Vim Insert mode: keybind edition:
vim.keymap.set("i", "<C-c>", "<Esc>")

-- Move a bit in insert mode
vim.keymap.set({ "c", "i" }, "<C-h>", "<Left>")
vim.keymap.set({ "c", "i" }, "<C-l>", "<Right>")

vim.keymap.set("i", "<M-h>", function()
  func.swap_char_b()
end)

vim.keymap.set("i", "<M-l>", function()
  func.swap_char_f()
end)

-- VISUAL mode Keybinds
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { silent = true })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { silent = true })

-- Strip trailing spaces from selection
vim.keymap.set("v", "<leader>s", function()
  local store = vim.fn.winsaveview()
  vim.cmd([[%s/\s\+$//e]])
  vim.fn.winrestview(store)
end)

vim.keymap.set("n", "<leader>zt", func.cursor_lock("t"), { desc = "Toggle cursor lock (top)" })
vim.keymap.set("n", "<leader>zc", func.cursor_lock("z"), { desc = "Toggle cursor lock (middle)" })
vim.keymap.set("n", "<leader>zb", func.cursor_lock("b"), { desc = "Toggle cursor lock (bottom)" })

-- Sort imports
vim.keymap.set("v", "<leader>i", "<cmd>'<,'>!awk '{print length, $0}' | sort -n | cut -d' ' -f2-<CR>")

-- Better indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- TERMINAL mode keybinds
vim.keymap.set("t", "<M-C-J>", "<C-\\><C-n>bd!<CR>")
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
vim.keymap.set("n", "<leader>te>", ":bd!", { desc = "Exit terminal" })
