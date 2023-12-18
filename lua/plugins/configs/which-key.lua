local wk = require("which-key")
local icons = require("core.icons")

-- LEADER plugin keybinds (Space for this config)
require("which-key").setup({
  key_labels = {
    ["<leader>"] = "Space",
    ["ñ"] = "Meta",
  },
  icons = {
    group = "",
  },
  window = {
    border = "single",
    margin = { 0, 4, 1, 1 },
    padding = { 0, 4, 2, 1 },
  },
  layout = {
    spacing = 2,
    align = "center",
  },
})

wk.register({
  -- which-key category entries
  ["<leader>b"] = { name = "Built-in [Buffers]" },
  ["<leader>c"] = { name = "Built-in [Buffers] [chmod]" },
  ["<leader>ca"] = { name = "a secret" },
  ["<leader>d"] = { name = "[Pets] [DB] [Word-toggler]" },
  ["<leader>D"] = { name = "[DAP]" },
  ["<leader>e"] = { name = "[Refactoring -> Extract]" },
  ["<leader>f"] = { name = "[Formatter]" },
  ["<leader>gc"] = { name = "[" .. icons.misc.git.icon .. " Git] Blame Copy" },
  ["<leader>G"] = { name = "[" .. icons.misc.git.icon .. " Gitsigns]" },
  ["<leader>g"] = { name = "[" .. icons.misc.git.icon .. " Git]" },
  ["<leader>i"] = { name = "[Indenting] [ISwap] [Word HL]" },
  ["<leader>l"] = { name = "[Leap] [Live Server] [Lazy]" },
  ["<leader>m"] = { name = "[" .. icons.misc.langs.markdown .. "Markdown] [Mason] [TS Move]" },
  ["<leader>n"] = { name = "[Aerial]" },
  ["<leader>k"] = { name = "[Harpoon]" },
  ["<leader>p"] = { name = "[Register-pasting]" },
  ["<leader>r"] = { name = "[Refactoring] [LSP Rename]" },
  ["<leader>s"] = { name = "[Sessions] [ISwap]" },
  ["<leader>t"] = { name = "[" .. icons.plugins.telescope .. "Telescope] [TS] [Harpoon] [To-Do]" },
  ["<leader>te"] = { name = "[Built-in] Terminal" },
  -- ["<leader>tt"] = { name = "[TS] Playground" },
  ["<leader>tc"] = { name = "[To-Do] [TS Context]" },
  ["<leader>tl"] = { name = "[" .. icons.plugins.telescope .. "Telescope] LSP Calls" },
  ["<leader>v"] = { name = "[" .. icons.plugins.telescope .. "Telescope] [Diags] [LSP]" },
  ["<leader>vc"] = { name = "[LSP] Code actions" },
  ["<leader>vr"] = { name = "[LSP] Variable actions" },
  ["<leader>w"] = { name = "Built-in [Windows] [Saving]" },
  ["<leader>x"] = { name = "[Trouble] [Export to HTML]" },
  ["<leader>xt"] = { name = "[Built-in] Export to HTML" },
  ["<leader>y"] = { name = "[Built-in] Register yanking" },
  ["<leader>z"] = { name = "[Zen-Mode] [Twilight]" },

  ["<localleader>b"] = { name = "[Shade]" },
  ["<localleader>h"] = { name = "[Hover-split]" },
  ["<localleader>x"] = { name = "[Executor]" },
  ["<localleader>D"] = { name = "[DAP]" },
  ["<localleader>DP"] = { name = "[DAP] Python testing" },

  -- My theme switcher
  ["<leader>th"] = { "<cmd>Themer<CR>", "[🔭] Colorscheme manager", { silent = true } },

  -- LSP Stuff
  ["gp"] = { name = "[LSP] Previews" },

  -- Filling in the blanks for native stuff
  ["gj"] = { name = "Go up 1 wrapped line" },
  ["gk"] = { name = "Go down 1 wrapped line" },
})
-- GitHub stuff
wk.register({
  g = {
    h = {
      name = "+[ Github]",
      c = {
        name = "+Commits",
        c = { "<cmd>GHCloseCommit<cr>", "Close" },
        e = { "<cmd>GHExpandCommit<cr>", "Expand" },
        o = { "<cmd>GHOpenToCommit<cr>", "Open To" },
        p = { "<cmd>GHPopOutCommit<cr>", "Pop Out" },
        z = { "<cmd>GHCollapseCommit<cr>", "Collapse" },
      },
      i = {
        name = "+Issues",
        p = { "<cmd>GHPreviewIssue<cr>", "Preview" },
      },
      l = {
        name = "+Litee",
        t = { "<cmd>LTPanel<cr>", "Toggle Panel" },
      },
      r = {
        name = "+Review",
        b = { "<cmd>GHStartReview<cr>", "Begin" },
        c = { "<cmd>GHCloseReview<cr>", "Close" },
        d = { "<cmd>GHDeleteReview<cr>", "Delete" },
        e = { "<cmd>GHExpandReview<cr>", "Expand" },
        s = { "<cmd>GHSubmitReview<cr>", "Submit" },
        z = { "<cmd>GHCollapseReview<cr>", "Collapse" },
      },
      p = {
        name = "+Pull Request",
        c = { "<cmd>GHClosePR<cr>", "Close" },
        d = { "<cmd>GHPRDetails<cr>", "Details" },
        e = { "<cmd>GHExpandPR<cr>", "Expand" },
        o = { "<cmd>GHOpenPR<cr>", "Open" },
        p = { "<cmd>GHPopOutPR<cr>", "PopOut" },
        r = { "<cmd>GHRefreshPR<cr>", "Refresh" },
        t = { "<cmd>GHOpenToPR<cr>", "Open To" },
        z = { "<cmd>GHCollapsePR<cr>", "Collapse" },
      },
      t = {
        name = "+Threads",
        c = { "<cmd>GHCreateThread<cr>", "Create" },
        n = { "<cmd>GHNextThread<cr>", "Next" },
        t = { "<cmd>GHToggleThread<cr>", "Toggle" },
      },
    },
  },
}, { prefix = "<leader>" })
