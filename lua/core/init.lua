-- Plugins 😃
require("core.plugin_manager")
-- Cuatom stuff
require("user")
-- HL Groups + persistence
require("core.highlights")

-- Colorschemes
-- last-color plugin
if not pcall(require, "last-color") then
  return
end
local theme = require("last-color").recall() or "tokyonight"
vim.cmd(("colorscheme %s"):format(theme))
