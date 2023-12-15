local M = {}

--- Diagnostic severities.
M.diagnostics = {
  ERROR = "󰅚",
  WARN = "",
  HINT = "",
  INFO = "",
}

--- For folding.
M.arrows = {
  right = "",
  left = "",
  up = "",
  down = "",
}

--- LSP symbol kinds.
M.symbol_kinds = {
  Array = "󰅪",
  Class = "",
  Color = "󰏘",
  Constant = "󰏿",
  Constructor = "",
  Enum = "",
  EnumMember = "",
  Event = "",
  Field = "󰜢",
  File = "󰈙",
  Folder = "󰉋",
  Function = "󰆧",
  Interface = "",
  Keyword = "󰌋",
  Method = "󰆧",
  Module = "",
  Operator = "󰆕",
  Property = "󰜢",
  Reference = "󰈇",
  Snippet = "",
  Struct = "",
  Text = "",
  TypeParameter = "",
  Unit = "",
  Value = "",
  Variable = "󰀫",
}

--- Shared icons that don't really fit into a category.
M.misc = {
  langs = {
    lua = "󰢱",
    markdown = " ",
  },
  bug = " ",
  folder = " ",
  neovim_solid = "",
  neovim_transparent = "",
  search = " ",
  terminal = " ",
  vertical_bar = "│",
  git = {
    icon = "",
    added = " ",
    modified = " ",
    removed = " ",
  },
}

M.plugins = {
  telescope = "󰭎 ",
  alpha = "",
  lazy = "󰒲",
  oil = "󱐋",
  trouble = " ",
  undotree = "󰃢 ",
  dap = {
    watches = " ",
    stacks = " ",
    breakpoints = " ",
    scopes = " ",
    repl = M.misc.terminal,
  },
}

return M
