local M = {}

--- Go to or create the *`n`*th tab
---@param n integer
function M.tabnm(n)
  return function()
    local tabs = vim.api.nvim_list_tabpages()
    if n > #tabs then
      vim.cmd("$tabnew")
    else
      local tabpage = tabs[n]
      vim.api.nvim_set_current_tabpage(tabpage)
    end
  end
end

--- Put the `char` variable at the beginning of the line. If present, remove it
---@param chars string
function M.put_at_end(chars)
  local pos = vim.api.nvim_win_get_cursor(0)
  local row = pos[1] - 1
  local current_line = vim.api.nvim_get_current_line()
  local col = #current_line
  ---@diagnostic disable-next-line: param-type-mismatch
  local cline = vim.fn.getline(".")
  ---@diagnostic disable-next-line: param-type-mismatch
  local endchar = vim.fn.getline("."):sub(-1)
  if endchar == chars then
    ---@diagnostic disable-next-line: param-type-mismatch
    vim.api.nvim_set_current_line(cline:sub(1, cline:len()-1))
  else
    vim.api.nvim_buf_set_text(0, row, col, row, col, { chars })
  end
end

--- Put the `char` variable at the end of the line. If present, remove it
---@param chars string
function M.put_at_beginning(chars)
  ---@diagnostic disable-next-line: param-type-mismatch
  local cline = vim.fn.getline(".")
  ---@diagnostic disable-next-line: param-type-mismatch
  -- vim.api.nvim_set_current_line(cline:sub(1, cline:len()-1))
  local pos = vim.api.nvim_win_get_cursor(0)
  local row = pos[1] - 1
  local col = 0
  local entry_length = string.len(chars)
  ---@diagnostic disable-next-line: param-type-mismatch
  local start_chars = string.sub(vim.fn.getline("."), 0, entry_length)
  if start_chars ~= chars then
    vim.api.nvim_buf_set_text(0, row, col, row, col, { chars })
  else
    ---@diagnostic disable-next-line: param-type-mismatch
    vim.api.nvim_set_current_line(cline:sub((entry_length + 1), cline:len()))
  end
end

--[[ 
# --------------------------------------------------- #
#    FUNCTIONS FOR RANGED / SINGLE LINE MACRO EXEC    #
# --------------------------------------------------- # 
]]
--- Stores current visual selection into the `v` register
function M.get_visual_selection()
  vim.cmd('noau normal! "vy"')
  return vim.fn.getreg("v")
end

--- Escapes the strings going into it
function M.escape_string(string_to_escape)
  local escape_chars = {
    "\\", '"', "'", "[", "]", ".", "*", "+", "-", "?", "^", "$",
    "(", ")", "%", "#", "{", "}", "|", "<", ">", "=", "!", ":",
  }
  for _, char in ipairs(escape_chars) do
    string_to_escape = vim.fn.escape(string_to_escape, char)
  end
  return string_to_escape
end

--- Record macro for a given word or visual selection
function M.record_macro()
  local mode = vim.api.nvim_get_mode().mode
  if mode == 'v' then
    local selection = M.get_visual_selection()
    local escaped_selection = M.escape_string(selection)
    vim.fn.setreg('/', escaped_selection)
  elseif mode == 'n' then
    -- Move cursor to the begginning of the word under the cursor and yank it
    vim.cmd('normal! "vyiw')
    local word = vim.fn.getreg('v')
    vim.fn.setreg('/', word)
  end
  -- start recording macro
  vim.cmd('normal! qi')
end

--- Correctly close the previously started macro
function M.confirm_macro()
  local mode = vim.api.nvim_get_mode().mode
  -- exit insert mode if it is being recorded
  if mode == 'i' then
    vim.cmd('stopinsert')
  -- exit visual mode if it is being recorded
  elseif mode == 'v' then
    -- feedkeys
    local esc = vim.api.nvim_replace_termcodes('<Esc>', true, false, true)
    vim.api.nvim_feedkeys(esc, 'x', false)
  end
  -- stop recording macro if it is being recorded
  -- or do nothing if it's not
  vim.cmd('normal! qq')
end


return M
