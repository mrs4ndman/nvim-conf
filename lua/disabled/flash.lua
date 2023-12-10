return {
  "folke/flash.nvim",
  opts = {
    labels = "hjklñasdfghquwieorpty",
    label = {
      uppercase = true,
      reuse = "all",
      distance = true,
      rainbow = { enabled = true, shade = 6 },
    },
    modes = {
      treesitter = {
        labels = "hjklñasdfghquwieorpty",
      },
    },
  },
  keys = {
    {
      "<leader>tS",
      mode = { "n", "x", "o" },
      function()
        require("flash").treesitter()
      end,
      desc = "Flash Treesitter",
    },
    {
      "<leader>ts",
      mode = { "n", "x", "o" },
      -- jumps to ts nodes
      function()
        local Treesitter = require("flash.plugins.treesitter")
        local Search = require("flash.search")
        require("flash").jump({
          matcher = function(win, state, opts)
            local search = Search.new(win, state)
            local matches = {}
            for _, m in ipairs(search:get(opts)) do
              m.label = false
              table.insert(matches, m)
              for _, n in ipairs(Treesitter.get_nodes(win, m.pos)) do
                n.highlight = false
                table.insert(matches, n)
              end
            end
            return matches
          end,
          search = {
            incremental = true,
          },
          label = { before = true, after = true, style = "inline" },
          remote_op = { restore = true },
        })
      end,
      desc = "Flash mega TS",
    },
  },
}
