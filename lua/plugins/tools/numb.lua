-- This plugin allows me to input a number in the command line and "peek" at
-- the state of the code in the lines around it.

return {
  "nacro90/numb.nvim",
  event = "CmdlineEnter",
  config = function()
    require("numb").setup({
      show_cursorline = true,
      centered_peeking = true,
    })
  end,
}
