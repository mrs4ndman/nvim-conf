local colors = {
  bg = "#202328",
  fg = "#bbc2cf",
  violet = "#a9a1e1",
  radioactive = "#FAE500",
  yellow = "#ECBE7B",
  cyan = "#008080",
  pink = "#FF00FF",
  darkblue = "#0037AA",
  turquoise = "#00CCCC",
  green = "#98be65",
  lime = "#00CC00",
  orange = "#FF8800",
  sorange = "#FF6600",
  magenta = "#c678dd",
  blue = "#51afef",
  red = "#FF0000",
  white = "#FFFFFF",
  ultraviolet = "#CC0099",
  butter = "#fffacf",
  milk = "#fdf6e3",
  cream = "#e6dac3",
  cashew = "#CEB999",
  almond = "#a6875a",
  cocoa = "#3b290e",
  evergreen = "#9fdfb4",
  snow = "#e4fffe",
  ice = "#a4e2e0",
  mint = "#a2e0ca",
  nectar = "#f0f070",
  cayenne = "#FF7D90",
  yam = "#e86f54",
  pumpkin = "#ff9969",
  rose = "#b32e29",
  mid_velvet = '#6E6EA3',

  deep_lavender = '#38265A',
  deep_licorice = '#252137',
  deep_anise = '#564D82',
  deep_velvet = '#8F8FB3',

  light_lavender = '#EAD6FF',
}

-- Groups used for my statusline.
---@type table<string, vim.api.keyset.highlight>
local statusline_groups = {}
for mode, color in pairs({
  Normal = "radioactive",
  Pending = "white",
  Visual = "yellow",
  V_Block = "ultraviolet",
  V_Line = "orange",
  Insert = "red",
  I_Normal = "radioactive",
  Command = "cyan",
  Replace = "blue",
  Other = "orange",
}) do
  statusline_groups["StatuslineMode" .. mode] = { fg = colors.bg, bg = colors[color] }

  statusline_groups["StatuslineModeSeparator" .. mode] = { fg = colors.bg, bg = colors[color] }
end
statusline_groups = vim.tbl_extend("error", statusline_groups, {
  CmpGhostText = { fg = colors.deep_lavender, bg = colors.deep_velvet, force = true },
  -- Statusline = { bg = "#000000" },
  StatuslineColumnIndicator = { fg = colors.yellow, bg = colors.bg },
  StatuslineCurrentLine = { fg = colors.lime, bg = colors.bg, bold = true },
  StatuslineDapIcon = { fg = colors.lime, bg = colors.bg, bold = true },
  StatuslineFilename = { fg = colors.red, bg = colors.bg, bold = true },
  StatuslineGit = { bg = colors.bg, fg = colors.orange, bold = true },
  StatuslineGitIcon = { fg = colors.orange, bg = colors.bg, bold = true },
  StatuslineItalic = { fg = colors.magenta, bg = colors.bg, italic = true },
  StatuslineLazyIcon = { fg = colors.turquoise, bg = colors.bg, italic = true },
  StatuslineLSPIconNone = { fg = colors.red, bg = colors.bg, bold = true },
  StatuslineLSPIconOk = { fg = colors.lime, bg = colors.bg, bold = true },
  StatuslineNoiceKeys = { fg = colors.magenta, bg = colors.bg },
  StatuslineNoiceMacro = { fg = colors.radioactive, bg = colors.bg },
  StatuslinePosSeparator = { fg = colors.white, bg = colors.bg },
  StatuslineSidemark = { fg = colors.blue, bg = colors.bg },
  StatuslineSpinner = { fg = colors.lime, bg = colors.transparent_black, bold = true },
  StatuslineTitle = { fg = colors.white, bg = colors.bg, bold = true },
  StatuslineTotalLines = { fg = colors.red, italic = true },
  StatuslineWhite = { fg = colors.white, bg = colors.bg, bold = true },
  WinbarTitle = {  bg = "" },
  WinbarSeparator = { bg = "" },
  WinbarSidemark = { link = "StatuslineSidemark", bg = "" },
})

for group, opts in pairs(statusline_groups) do
  vim.api.nvim_set_hl(0, group, opts)
end

vim.api.nvim_create_autocmd("Colorscheme", {
  callback = function()
    for group, opts in pairs(statusline_groups) do
      vim.api.nvim_set_hl(0, group, opts)
    end
  end,
})
