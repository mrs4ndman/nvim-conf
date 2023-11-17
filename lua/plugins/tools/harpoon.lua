Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "harpoon"

return {
  -- 6.- ThePrimeagen plugins (Blazingly Fast)
  "ThePrimeagen/" .. plugin, -- Reeling those files in
  enabled = Is_Enabled(plugin),
  keys = {
    { "<leader>1", desc = "[Harpoon] File 1" },
    { "<leader>2", desc = "[Harpoon] File 2" },
    { "<leader>3", desc = "[Harpoon] File 3" },
    { "<leader>4", desc = "[Harpoon] File 4" },
    { "<leader>5", desc = "[Harpoon] File 5" },
    { "<leader>6", desc = "[Harpoon] File 6" },
    { "<leader>7", desc = "[Harpoon] File 7" },
    { "<leader>8", desc = "[Harpoon] File 8" },
    { "<leader>9", desc = "[Harpoon] File 9" },
    { "<leader>0", desc = "[Harpoon] File 10" },
    { "<localleader><localleader>", desc = "[Harpoon] Toggle menu" },
    { "<localleader>a", desc = "[Harpoon] File 1" },
    { "<localleader>s", desc = "[Harpoon] File 2" },
    { "<localleader>d", desc = "[Harpoon] File 3" },
    { "<localleader>f", desc = "[Harpoon] File 4" },
    { "<leader>a", desc = "[Harpoon] Add file" },
    { "<leader>h", desc = "[Harpoon] Toggle menu" },
    { "<leader>kn", desc = "[Harpoon] Next" },
    { "<leader>kp", desc = "[Harpoon] Prev" },
    { "<leader>t1", desc = "[Harpoon] Terminal 1" },
    { "<leader>t2", desc = "[Harpoon] Terminal 2" },
    { "<leader>t3", desc = "[Harpoon] Terminal 3" },
    { "<leader>t4", desc = "[Harpoon] Terminal 4" },
  },
  config = function()
    require("harpoon").setup({
      global_settings = {
        save_on_toggle = true,
        save_on_change = true,
        mark_branch = false,
      },
    })
    local mark = require("harpoon.mark")
    local ui = require("harpoon.ui")
    local term = require("harpoon.term")

    vim.keymap.set("n", "<leader>a", mark.add_file)
    vim.keymap.set("n", "<leader>h", ui.toggle_quick_menu)
    vim.keymap.set("n", "<localleader><localleader>", ui.toggle_quick_menu)

    vim.keymap.set("n", "<leader>kn", ui.nav_next)
    vim.keymap.set("n", "<leader>kp", ui.nav_prev)

    local localleaderKeys = { a = 1, s = 2, d = 3, f = 4 }

    for k, v in pairs(localleaderKeys) do
      vim.keymap.set("n", "<localleader>" .. k, function()
        ui.nav_file(v)
      end)
    end

    for i = 1, 9 do
      vim.keymap.set("n", string.format("<leader>%s", i), function()
        ui.nav_file(i)
      end)
    end
    for i = 1, 4 do
      vim.keymap.set("n", string.format("<leader>T%s", i), function()
        term.gotoTerminal(i)
      end)
    end
  end,
}
