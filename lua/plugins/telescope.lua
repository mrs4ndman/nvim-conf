require("balls").register({ url = GH .. "nvim-telescope/telescope.nvim" })
require("balls").register({ url = GH .. "nvim-lua/plenary.nvim" })
require("balls").register({ url = GH .. "barrett-ruth/telescope-http.nvim" })
require("balls").register({
  url = GH .. "nvim-telescope/telescope-fzf-native.nvim",
  on_sync = function(plugin)
    vim.system({ "make" }, { cwd = plugin:path() })
  end,
})
--   keys = {
--     -- TELESCOPE
vim.keymap.set("n", "<leader>tf", "<cmd>Telescope find_files<CR>", { desc = "[🔭] Find files" })
vim.keymap.set("n", "<leader>tg", "<cmd>Telescope live_grep<CR>", { desc = "[🔭] Grep through files" })
vim.keymap.set("n", "<leader>tb", "<cmd>Telescope buffers<CR>", { desc = "[🔭] List buffers" })
vim.keymap.set("n", "<leader>vh", "<cmd>Telescope help_tags<CR>", { desc = "[🔭] Help tags" })
vim.keymap.set("n", "<leader>sg", "<cmd>Telescope grep_string<CR>", { desc = "[🔭] Fast string grep" })
vim.keymap.set("n", "<leader>tr", "<cmd>Telescope oldfiles<CR>", { desc = "[🔭] Recent files" })
vim.keymap.set("n", "<leader>tli", "<cmd>Telescope lsp_incoming_calls", { desc = "[🔭-LSP] Incoming calls" })
vim.keymap.set("n", "<leader>tlo", "<cmd>Telescope lsp_outgoing_calls", { desc = "[🔭-LSP] Outgoing calls" })

require("telescope").setup({
  pickers = {
    colorscheme = { enable_preview = true },
    find_files = {
      find_command = { "fd", "--type", "f", "--hidden", "--exclude", ".git", "--strip-cwd-prefix" },
      -- BUG: THIS FUCKER IS GIVING ME TROUBLE :/
--       theme = "ivy",
    },
    oldfiles = {
      theme = "ivy",
    },
    live_grep = {
      layout_strategy = "vertical",
      -- theme = "dropdown"
    },
    buffers = { ignore_current_buffer = true },
  },
  defaults = {
    theme = "dropdown",
    vimgrep_arguments = {
      "rg",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--hidden",
      "--glob=!{.git,.svn,.hg,.DS_Store,thumbs.db,node_modules,bower_components}",
    },
    sort_mru = true,
    sorting_strategy = "ascending",
    color_devicons = true,
    layout_strategy = "horizontal",
    layout_config = {
      prompt_position = "top",
      horizontal = { width_padding = 0.04, height_padding = 0.1 },
      vertical = { width_padding = 0.05, height_padding = 1 },
    },
    border = true,
    prompt_prefix = "   ",
    hl_result_eol = false,
    -- results_title = "",
    wrap_results = true,
    hidden = true,
    mappings = {
      i = {
        ["<C-q>"] = require("telescope.actions").send_to_qflist + require("telescope.actions").open_qflist,
        ["<M-q>"] = require("telescope.actions").send_selected_to_qflist + require("telescope.actions").open_qflist,
        ["<C-n>"] = require("telescope.actions").preview_scrolling_down,
        ["<C-p>"] = require("telescope.actions").preview_scrolling_up,
        ["<C-h>"] = require("telescope.actions").preview_scrolling_left,
        ["<C-l>"] = require("telescope.actions").preview_scrolling_right,
        -- ["<M-p>"] = action_layout.toggle_preview,
        ["<C-j>"] = require("telescope.actions").move_selection_next,
        ["<C-k>"] = require("telescope.actions").move_selection_previous,
        ["<Esc>"] = require("telescope.actions").close,
      },
      n = {
        -- ["<M-p>"] = action_layout.toggle_preview,
        ["<C-n>"] = require("telescope.actions").preview_scrolling_down,
        ["<C-p>"] = require("telescope.actions").preview_scrolling_up,
        ["<M-s>"] = require("telescope.actions").file_split,
        ["<M-v>"] = require("telescope.actions").file_vsplit,
      },
    },
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    },
  },
})
require("telescope").load_extension("http")
require("telescope").load_extension("fzf")
vim.keymap.set("n", "<leader>tH", "<cmd>Telescope http list<CR>", { desc = "HTTP Status codes" })
