return {
  "davidgranstrom/nvim-markdown-preview",
  cmd = { "MarkdownPreview" },
  ft = { "markdown" },
  keys = {
    { "<leader>md", "<cmd>MarkdownPreview<CR>", desc = "Toggle MD preview" },
  },
  config = function()
    vim.g.nvim_markdown_preview_theme = "github"
  end
}
