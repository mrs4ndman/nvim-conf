-- Fully custom statusline and winbar
if not pcall(require, "user.keymaps") then
  print("Keymaps not loaded: error found")
end
if not pcall(require, "user.set") then
  print("Settings not loaded: error found")
end
if not pcall(require, "user.autocmds") then
  print("Auto-commands not loaded: error found")
end
if not pcall(require, "user.statusline") then
  print("Statusline not loaded: error found")
end
if not pcall(require, "user.winbar") then
  print("Winbar not loaded: error found")
end
