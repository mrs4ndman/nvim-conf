Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled

local plugin = "trouble.nvim"

return {
  "folke/" .. plugin,
  cmd = { "TroubleToggle", "Trouble" },
  keys = {
    { "<leader>xx", "<cmd>TroubleToggle<CR>", desc = "[Trouble] Toggle list" },
    { "<leader>xq", "<cmd>TroubleToggle quickfix<CR>", desc = "[Trouble] Toggle quickfix" },
    { "<leader>xl", "<cmd>TroubleToggle loclist<CR>", desc = "[Trouble] Toggle loclist" },
    { "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<CR>", desc = "[Trouble] Workspace Diagnostics" },
    { "<leader>xd", "<cmd>TroubleToggle document_diagnostics<CR>", desc = "[Trouble] Document Diagnostics" },
    { "gr", "<cmd>TroubleToggle lsp_references<CR>", desc = "[Trouble] LSP References" },
  },
  opts = {
    opts = { use_diagnostic_signs = true },
  },
}
