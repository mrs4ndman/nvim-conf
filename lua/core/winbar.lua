local M = {}

local folder_icon = require("core.icons").misc.folder

---@return string
function M.render()
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
    if prefix ~= '' then
      path = path:gsub('^' .. prefix_path, '')
      prefix = string.format("%%#WinbarSpecial#%s %s%s", folder_icon, prefix, separator)
    end
  end
-- Remove trailing slash.
  path = path:gsub("^/", "")

  return table.concat({
    "▊ ",
    prefix,
    table.concat(
      vim.iter.map(function(segment)
      return string.format('%%#Winbar#%s', segment)
      end, vim.split(path, "/")),
      separator
    ),
  })
end

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
      vim.wo.winbar = "%{%v:lua.require'core.winbar'.render()%}"
    end
  end
})


vim.o.winbar = "%!v:lua.require'core.winbar'.render()"

return M
