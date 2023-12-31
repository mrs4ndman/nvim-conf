return {
  "google/executor.nvim",
  keys = {
    { "<localleader>xc", "<cmd>ExecutorRun<CR>", desc = "[Exec] Start Executor" },
    { "<localleader>xs", "<cmd>ExecutorSetCommand<CR>", desc = "[Exec] Set Executor command" },
    { "<localleader>xd", "<cmd>ExecutorToggleDetail<CR>", desc = "[Exec] Toggle Executor detail" },
    { "<localleader>xr", "<cmd>ExecutorReset<CR>", desc = "[Exec] Reset Executor status" },
    { "<localleader>xp", "<cmd>ExecutorShowPresets<CR>", desc = "[Exec] Show presets for CWD" },
  },
  opts = {
    use_split = true,
    split = {
      position = "right",
      size = math.floor(vim.o.columns * 1 / 4),
    },
    notifications = { task_started = true, task_completed = true },
    preset_commands = {
      ["custom-website"] = {
        "npm run dev",
      },
    },
  },
}
