local balls_path = vim.fs.joinpath(vim.fn.stdpath("config"), "pack", "balls", "start", "balls.nvim")

if not vim.uv.fs_stat(balls_path) then
  local command = {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/TheBallsUp/balls.nvim",
    balls_path
  }

  vim.system(command, { text = true }, function(result)
    if result.code ~= 0 then
      vim.notify("Failed to install balls.nvim: " .. result.stderr, vim.log.levels.ERROR)
      return
    end

    vim.notify("Installed balls.nvim!", vim.log.levels.INFO)
    vim.cmd.helptags(vim.fs.joinpath(balls_path, "doc"))
  end)
end

-- Colorscheme
require("plugins.colorscheme")
-- Treeshitter
require("plugins.treesitter")
-- Oil
require("plugins.oil")
-- Completion
require("plugins.cmp")
-- LSP
require("plugins.lsp")
-- UI
require("plugins.ui")
-- Telescope
require("plugins.telescope")
-- General stuff
require("plugins.editor")
require("plugins.java")

