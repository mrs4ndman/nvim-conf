local wk = require("which-key")

-- LEADER plugin keybinds (Space for this config)
require("which-key").setup({
  -- keys= {
  --   ["<leader>"] = "Space",
  --   ["ñ"] = "Meta",
  -- },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
    ellipsis = "…",
  },
  win = {
    border = "single",
  },
  layout = {
    spacing = 2,
    align = "center",
  },
})

wk.add({
  {
    { "<leader>D", group = "[DAP]" },
    { "<leader>G", group = "[ Gitsigns]" },
    { "<leader>b", group = "[Built-in - Buffers]" },
    { "<leader>c", group = "[Built-in - Buffers, chmod]" },
    { "<leader>ca", group = "a secret" },
    { "<leader>d", group = "[Pets] [DB] [Word-toggler]" },
    { "<leader>e", group = "[Refactoring -> Extract]" },
    { "<leader>f", group = "[Formatter]" },
    { "<leader>g", group = "[ Git]" },
    { "<leader>gc", group = "[ Git] Blame Copy" },
    { "<leader>i", group = "[Indenting] [ISwap] [Word HL]" },
    { "<leader>k", group = "[Harpoon]" },
    { "<leader>l", group = "[Leap] [Live Server] [Lazy]" },
    { "<leader>m", group = "[ Markdown] [Mason] [TS Move]" },
    { "<leader>n", group = "[Aerial]" },
    { "<leader>p", group = "[Register-pasting]" },
    { "<leader>r", group = "[Refactoring] [LSP Rename]" },
    { "<leader>s", group = "[Sessions] [ISwap]" },
    { "<leader>t", group = "[󰭎 Telescope] [TS] [Harpoon] [To-Do]" },
    { "<leader>td", group = "[To-Do]" },
    { "<leader>tc", group = "[To-Do] [TS Context]" },
    { "<leader>te", group = "[Built-in - Terminal]" },
    { "<leader>th", "<cmd>Themer<CR>", desc = "[🔭] Colorscheme manager" },
    { "<leader>v", group = "[󰭎 Telescope] [Diags] [LSP]" },
    { "<leader>vc", group = "[LSP] Code actions" },
    { "<leader>vr", group = "[LSP] Variable actions" },
    { "<leader>w", group = "[Built-in -Windows, Saving]" },
    { "<leader>x", group = "[Trouble]"},
    { "<leader>y", group = "[Built-in - Register yanking]" },
    { "<leader>z", group = "[Zen-Mode] [Twilight]" },
    { "<localleader>D", group = "[DAP]" },
    { "<localleader>DP", group = "[DAP] Python testing" },
    -- { "<localleader>b", group = "[Shade]" },
    -- { "<localleader>h", group = "[Hover-split]" },
    { "<localleader>x", group = "[Executor]" },
    { "gj", group = "Go up 1 wrapped line" },
    { "gk", group = "Go down 1 wrapped line" },
    { "gra", group = "[Trouble] Get code actions" },
    { "gri", group = "[Trouble] Get implementation(s)" },
    { "grn", group = "[Trouble] Rename under cursor" },
    { "grr", group = "[Trouble] Get references" },
    { "grt", group = "[Trouble] Get type definition" },
  },
})
