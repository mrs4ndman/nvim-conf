return {
  "nvim-telescope/telescope.nvim",
  lazy = false,
  cmd = { "Telescope", "TeleCommit" },
  -- tag = "0.1.4",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },

  keys = {
    -- TELESCOPE
    { "<leader>ta", "<cmd>Telescope aerial<CR>", desc = "[🔭] Find symbols in current file" },
    { "<leader>tf", "<cmd>Telescope find_files<CR>", desc = "[🔭] Find files" },
    { "<leader>tg", "<cmd>Telescope live_grep<CR>", desc = "[🔭] Grep through files" },
    { "<leader>tb", "<cmd>Telescope buffers<CR>", desc = "[🔭] List buffers" },
    { "<leader>sh", "<cmd>Telescope highlights<CR>", desc = "[🔭] List hightlights" },
    { "<leader>vh", "<cmd>Telescope help_tags<CR>", desc = "[🔭] Help tags" },
    { "<leader>sg", "<cmd>Telescope grep_string<CR>", desc = "[🔭] Fast string grep" },
    { "<leader>tr", "<cmd>Telescope oldfiles<CR>", desc = "[🔭] Recent files" },
    { "<leader>lh", "<cmd>Telescope highlights<CR>", desc = "[🔭] List highlights" },
    { "<leader>ld", "<cmd>Telescope diagnostics<CR>", desc = "[🔭] Grep through files" },
  },
  config = function()
    require("telescope").setup({
      pickers = {
        colorscheme = { enable_preview = true },
        find_files = {
          find_command = { "fd", "--type", "f", "--hidden", "--exclude", ".git", "--strip-cwd-prefix" },
          -- BUG: THIS FUCKER IS GIVING ME TROUBLE :/
          theme = "ivy",
        },
        oldfiles = {
          theme = "ivy",
        },
        live_grep = {
          layout_strategy = "vertical",
          -- theme = "ivy"
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
        wrap_results = true,
        hidden = true,
        mappings = {
          i = {
            ["<C-q>"] = require("telescope.actions").send_to_qflist,
            ["<M-q>"] = require("telescope.actions").send_selected_to_qflist,
            ["<C-n>"] = require("telescope.actions").preview_scrolling_down,
            ["<C-p>"] = require("telescope.actions").preview_scrolling_up,
            ["<C-h>"] = require("telescope.actions").preview_scrolling_left,
            ["<C-l>"] = require("telescope.actions").preview_scrolling_right,
            ["<C-j>"] = require("telescope.actions").move_selection_next,
            ["<C-k>"] = require("telescope.actions").move_selection_previous,
            ["<C-v>"] = "select_vertical",
            ["<C-s>"] = "select_horizontal",
            ["<Esc>"] = require("telescope.actions").close,
          },
          n = {
            ["<C-n>"] = require("telescope.actions").preview_scrolling_down,
            ["<C-p>"] = require("telescope.actions").preview_scrolling_up,
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
    require("telescope").load_extension("fzf")
    vim.keymap.set("n", "<leader>sb", function()
      require("telescope.builtin").live_grep({ search_dirs = { vim.api.nvim_buf_get_name(0) } })
    end, { desc = "[🔭] Search current buffer" })
  end,
}
