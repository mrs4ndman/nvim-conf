return {
  "mfussenegger/nvim-dap-python",
  enabled = false,
  dependencies = { "mfussenegger/nvim-dap" },
  ft = "python",
  keys = {
    {
      "<localleader>DPt",
      function()
        require("dap-python").test_method()
      end,
      desc = "[DAP] Python test method",
    },
    {
      "<localleader>DPc",
      function()
        require("dap-python").test_class()
      end,
      desc = "[DAP] Python test class",
    },
  },
  config = function()
    local path = require("mason-registry").get_package("debugpy"):get_install_path()
    require("dap-python").setup(path .. "/venv/bin/python")
  end,
}
