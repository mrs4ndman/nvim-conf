Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "dropbar.nvim"

return {
  "Bekaboo/" .. plugin,
  -- enabled = Is_Enabled(plugin),
  enabled = false,
  event = "BufReadPost",
  -- lazy = false,
  keys = {
    {
      "<leader>nv",
      function()
        require("dropbar.api").pick()
      end,
      desc = "[UI] Pick element to navigate",
    },
  },
  opts = {
    bar = {
      pick = { pivots = "asdfhjlkqweruioptyzxcvbnm" },
    },
  },
}
