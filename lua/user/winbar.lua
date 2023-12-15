local M = {}

local icons = require("core.icons")

function M.navic_component()
  if not package.loaded["nvim-navic"] or require("nvim-navic").get_location() == "" then
    return ""
  end
  return "  " .. "%{%v:lua.require'nvim-navic'.get_location()%}"
end

--- Side marks, a la Doom-Emacs
---@return string
function M.side_marks_component()
  return string.format("%%#WinbarSidemark#▊%%##")
end

---@return string
function M.path()
  local path = vim.fs.normalize(vim.fn.expand("%:p") --[[@as string]])
  -- No slashes, just arrows
  local separator = " %#WinbarSeparator# "

  local prefix, prefix_path = "", ""

  if vim.api.nvim_win_get_width(0) < math.floor(vim.o.columns / 3) then
    path = vim.fn.pathshorten(path)
  else
    -- Now we define some special folders. For them, we add a prefix instead
    -- of the full path, and we make sure to pick the longest prefix
    ---@type table<string, string>
    local special_dirs = {
      CODE = vim.g.projects_dir,
      CONFIG = tostring(vim.fn.stdpath("config")),
      HOME = vim.env.HOME,
      DOTFILES = vim.env.HOME .. "/dotfiles",
    }
    for dir_name, dir_path in pairs(special_dirs) do
      if vim.startswith(path, vim.fs.normalize(dir_path)) and #dir_path > #prefix_path then
        prefix, prefix_path = dir_name, dir_path
      end
    end
    if prefix ~= "" then
      path = path:gsub("^" .. prefix_path, "")
      prefix = string.format("%%#WinbarTitle#%s %s%s", icons.misc.folder, prefix, separator)
    end
  end
  -- Remove trailing slash.
  path = path:gsub("^/", "")

  return table.concat({
    " ",
    prefix,
    table.concat(
      vim.iter.map(function(segment)
        return string.format("%%#WinbarTitle#%s", segment)
      end, vim.split(path, "/")),
      separator
    ),
  })
end

--- Render all the components together
function M.render()
  return table.concat({
    M.side_marks_component(),
    M.path(),
    M.navic_component(),
    "%=",
    M.side_marks_component(),
  })
end

-- Winbar dumb-but-smart attach
vim.api.nvim_create_autocmd("BufWinEnter", {
  group = vim.api.nvim_create_augroup("mrsandman/winbar", { clear = true }),
  desc = "Attach winbar",
  callback = function(args)
    if
      not vim.api.nvim_win_get_config(0).zindex -- Not a floating window
      and vim.bo[args.buf].buftype == "" -- Normal buffer
      and vim.api.nvim_buf_get_name(args.buf) ~= "" -- Has a file name
      and not vim.wo[0].diff -- Not in diff mode
    then
      vim.wo.winbar = "%{%v:lua.require'user.winbar'.render()%}"
    end
  end,
})

-- Custom winbars based on filetype
vim.api.nvim_create_autocmd({ "CursorMoved", "BufWinEnter", "BufFilePost" }, {
  callback = function()
    local winbar_ft_list = {
      "help",
      "startify",
      "dashboard",
      "lazy",
      "Trouble",
      "alpha",
      "Outline",
      "TelescopePrompt",
      "DressingInput",
      "DressingSelect",
      "octo",
    }

    if vim.api.nvim_win_get_config(0).relative ~= "" then
      return
    end

    local hl_group = "WinbarExtra"

    ---@type table<string, string>
    local extra_win_table = {
      ["dapui_watches"] = " " .. "%#" .. hl_group .. "#" .. icons.plugins.dap.watches .. "Watches" .. "%*",
      ["dapui_stacks"] = " " .. "%#" .. hl_group .. "#" .. icons.plugins.dap.stacks .. "Stacks" .. "%*",
      ["dapui_breakpoints"] = " " .. "%#" .. hl_group .. "#" .. icons.plugins.dap.breakpoints .. "Breakpoints" .. "%*",
      ["dapui_scopes"] = " " .. "%#" .. hl_group .. "#" .. icons.plugins.dap.scopes .. "Scopes" .. "%*",
      ["dap-repl"] = " " .. "%#" .. hl_group .. "#" .. icons.misc.terminal .. "Debug REPL" .. "%*",
      ["dapui_console"] = " " .. "%#" .. hl_group .. "#" .. icons.misc.terminal .. "Consola" .. "%*",
      ["gitcommit"] = " " .. "%#" .. hl_group .. "#" .. icons.misc.git.icon .. "Commit" .. "%*",
    }

    for k, v in pairs(extra_win_table) do
      if vim.bo.filetype == k then
        vim.opt_local.winbar = v
      end
    end

    if vim.tbl_contains(winbar_ft_list, vim.bo.filetype) then
      vim.opt_local.winbar = nil
      return
    end

    local is_winbar_ok, winbar = pcall(require, "user.winbar")
    if not is_winbar_ok or type(winbar) == "boolean" then
      vim.opt_local.winbar = nil
      return
    end
  end,
})

vim.o.winbar = "%{%v:lua.require'user.winbar'.render()%}"

return M
