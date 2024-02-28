local wk = require("which-key")
local icons = require("core.icons")

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
    { "<leader>b", group = "Built-in [Buffers]" },
    { "<leader>c", group = "Built-in [Buffers] [chmod]" },
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
    { "<leader>tc", group = "[To-Do] [TS Context]" },
    { "<leader>te", group = "[Built-in] Terminal" },
    { "<leader>th", "<cmd>Themer<CR>", desc = "[🔭] Colorscheme manager" },
    { "<leader>tl", group = "[󰭎 Telescope] LSP Calls" },
    { "<leader>v", group = "[󰭎 Telescope] [Diags] [LSP]" },
    { "<leader>vc", group = "[LSP] Code actions" },
    { "<leader>vr", group = "[LSP] Variable actions" },
    { "<leader>w", group = "Built-in [Windows] [Saving]" },
    { "<leader>x", group = "[Trouble] [Export to HTML]" },
    { "<leader>xt", group = "[Built-in] Export to HTML" },
    { "<leader>y", group = "[Built-in] Register yanking" },
    { "<leader>z", group = "[Zen-Mode] [Twilight]" },
    { "<localleader>D", group = "[DAP]" },
    { "<localleader>DP", group = "[DAP] Python testing" },
    { "<localleader>b", group = "[Shade]" },
    { "<localleader>h", group = "[Hover-split]" },
    { "<localleader>x", group = "[Executor]" },
    { "gj", group = "Go up 1 wrapped line" },
    { "gk", group = "Go down 1 wrapped line" },
    { "gp", group = "[LSP] Previews" },
  },
})

-- wk.register({
--   -- which-key category entries
--   ["<leader>b"] = { name = "Built-in [Buffers]" },
--   ["<leader>c"] = { name = "Built-in [Buffers] [chmod]" },
--   ["<leader>ca"] = { name = "a secret" },
--   ["<leader>d"] = { name = "[Pets] [DB] [Word-toggler]" },
--   ["<leader>D"] = { name = "[DAP]" },
--   ["<leader>e"] = { name = "[Refactoring -> Extract]" },
--   ["<leader>f"] = { name = "[Formatter]" },
--   ["<leader>gc"] = { name = "[" .. icons.misc.git.icon .. " Git] Blame Copy" },
--   ["<leader>G"] = { name = "[" .. icons.misc.git.icon .. " Gitsigns]" },
--   ["<leader>g"] = { name = "[" .. icons.misc.git.icon .. " Git]" },
--   ["<leader>i"] = { name = "[Indenting] [ISwap] [Word HL]" },
--   ["<leader>l"] = { name = "[Leap] [Live Server] [Lazy]" },
--   ["<leader>m"] = { name = "[" .. icons.misc.langs.markdown .. "Markdown] [Mason] [TS Move]" },
--   ["<leader>n"] = { name = "[Aerial]" },
--   ["<leader>k"] = { name = "[Harpoon]" },
--   ["<leader>p"] = { name = "[Register-pasting]" },
--   ["<leader>r"] = { name = "[Refactoring] [LSP Rename]" },
--   ["<leader>s"] = { name = "[Sessions] [ISwap]" },
--   ["<leader>t"] = { name = "[" .. icons.plugins.telescope .. "Telescope] [TS] [Harpoon] [To-Do]" },
--   ["<leader>te"] = { name = "[Built-in] Terminal" },
--   -- ["<leader>tt"] = { name = "[TS] Playground" },
--   ["<leader>tc"] = { name = "[To-Do] [TS Context]" },
--   ["<leader>tl"] = { name = "[" .. icons.plugins.telescope .. "Telescope] LSP Calls" },
--   ["<leader>v"] = { name = "[" .. icons.plugins.telescope .. "Telescope] [Diags] [LSP]" },
--   ["<leader>vc"] = { name = "[LSP] Code actions" },
--   ["<leader>vr"] = { name = "[LSP] Variable actions" },
--   ["<leader>w"] = { name = "Built-in [Windows] [Saving]" },
--   ["<leader>x"] = { name = "[Trouble] [Export to HTML]" },
--   ["<leader>xt"] = { name = "[Built-in] Export to HTML" },
--   ["<leader>y"] = { name = "[Built-in] Register yanking" },
--   ["<leader>z"] = { name = "[Zen-Mode] [Twilight]" },
--
--   ["<localleader>b"] = { name = "[Shade]" },
--   ["<localleader>h"] = { name = "[Hover-split]" },
--   ["<localleader>x"] = { name = "[Executor]" },
--   ["<localleader>D"] = { name = "[DAP]" },
--   ["<localleader>DP"] = { name = "[DAP] Python testing" },
--
--   -- My theme switcher
--   ["<leader>th"] = { "<cmd>Themer<CR>", "[🔭] Colorscheme manager", { silent = true } },
--
--   -- LSP Stuff
--   ["gp"] = { name = "[LSP] Previews" },
--
--   -- Filling in the blanks for native stuff
--   ["gj"] = { name = "Go up 1 wrapped line" },
--   ["gk"] = { name = "Go down 1 wrapped line" },
-- })
-- GitHub stuff

wk.add({
  {
    { "<leader>gh", group = "[ Github]" },
    { "<leader>ghc", group = "Commits" },
    { "<leader>ghcc", "<cmd>GHCloseCommit<cr>", desc = "Close" },
    { "<leader>ghce", "<cmd>GHExpandCommit<cr>", desc = "Expand" },
    { "<leader>ghco", "<cmd>GHOpenToCommit<cr>", desc = "Open To" },
    { "<leader>ghcp", "<cmd>GHPopOutCommit<cr>", desc = "Pop Out" },
    { "<leader>ghcz", "<cmd>GHCollapseCommit<cr>", desc = "Collapse" },
    { "<leader>ghi", group = "Issues" },
    { "<leader>ghip", "<cmd>GHPreviewIssue<cr>", desc = "Preview" },
    { "<leader>ghl", group = "Litee" },
    { "<leader>ghlt", "<cmd>LTPanel<cr>", desc = "Toggle Panel" },
    { "<leader>ghp", group = "Pull Request" },
    { "<leader>ghpc", "<cmd>GHClosePR<cr>", desc = "Close" },
    { "<leader>ghpd", "<cmd>GHPRDetails<cr>", desc = "Details" },
    { "<leader>ghpe", "<cmd>GHExpandPR<cr>", desc = "Expand" },
    { "<leader>ghpo", "<cmd>GHOpenPR<cr>", desc = "Open" },
    { "<leader>ghpp", "<cmd>GHPopOutPR<cr>", desc = "PopOut" },
    { "<leader>ghpr", "<cmd>GHRefreshPR<cr>", desc = "Refresh" },
    { "<leader>ghpt", "<cmd>GHOpenToPR<cr>", desc = "Open To" },
    { "<leader>ghpz", "<cmd>GHCollapsePR<cr>", desc = "Collapse" },
    { "<leader>ghr", group = "Review" },
    { "<leader>ghrb", "<cmd>GHStartReview<cr>", desc = "Begin" },
    { "<leader>ghrc", "<cmd>GHCloseReview<cr>", desc = "Close" },
    { "<leader>ghrd", "<cmd>GHDeleteReview<cr>", desc = "Delete" },
    { "<leader>ghre", "<cmd>GHExpandReview<cr>", desc = "Expand" },
    { "<leader>ghrs", "<cmd>GHSubmitReview<cr>", desc = "Submit" },
    { "<leader>ghrz", "<cmd>GHCollapseReview<cr>", desc = "Collapse" },
    { "<leader>ght", group = "Threads" },
    { "<leader>ghtc", "<cmd>GHCreateThread<cr>", desc = "Create" },
    { "<leader>ghtn", "<cmd>GHNextThread<cr>", desc = "Next" },
    { "<leader>ghtt", "<cmd>GHToggleThread<cr>", desc = "Toggle" },
  },
})

-- wk.register({
--   g = {
--     h = {
--       name = "+[ Github]",
--       c = {
--         name = "+Commits",
--         c = { "<cmd>GHCloseCommit<cr>", "Close" },
--         e = { "<cmd>GHExpandCommit<cr>", "Expand" },
--         o = { "<cmd>GHOpenToCommit<cr>", "Open To" },
--         p = { "<cmd>GHPopOutCommit<cr>", "Pop Out" },
--         z = { "<cmd>GHCollapseCommit<cr>", "Collapse" },
--       },
--       i = {
--         name = "+Issues",
--         p = { "<cmd>GHPreviewIssue<cr>", "Preview" },
--       },
--       l = {
--         name = "+Litee",
--         t = { "<cmd>LTPanel<cr>", "Toggle Panel" },
--       },
--       r = {
--         name = "+Review",
--         b = { "<cmd>GHStartReview<cr>", "Begin" },
--         c = { "<cmd>GHCloseReview<cr>", "Close" },
--         d = { "<cmd>GHDeleteReview<cr>", "Delete" },
--         e = { "<cmd>GHExpandReview<cr>", "Expand" },
--         s = { "<cmd>GHSubmitReview<cr>", "Submit" },
--         z = { "<cmd>GHCollapseReview<cr>", "Collapse" },
--       },
--       p = {
--         name = "+Pull Request",
--         c = { "<cmd>GHClosePR<cr>", "Close" },
--         d = { "<cmd>GHPRDetails<cr>", "Details" },
--         e = { "<cmd>GHExpandPR<cr>", "Expand" },
--         o = { "<cmd>GHOpenPR<cr>", "Open" },
--         p = { "<cmd>GHPopOutPR<cr>", "PopOut" },
--         r = { "<cmd>GHRefreshPR<cr>", "Refresh" },
--         t = { "<cmd>GHOpenToPR<cr>", "Open To" },
--         z = { "<cmd>GHCollapsePR<cr>", "Collapse" },
--       },
--       t = {
--         name = "+Threads",
--         c = { "<cmd>GHCreateThread<cr>", "Create" },
--         n = { "<cmd>GHNextThread<cr>", "Next" },
--         t = { "<cmd>GHToggleThread<cr>", "Toggle" },
--       },
--     },
--   },
-- }, { prefix = "<leader>" })
