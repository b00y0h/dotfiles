return {
  {
    "coder/claudecode.nvim",
    dependencies = { "folke/snacks.nvim" },
    config = true,
    keys = {
      { "<leader>ac", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" },
      { "<leader>af", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" },
    },
    opts = {
      -- Terminal split settings
      split_side = "right",
      split_width_percentage = 0.4,
      -- Auto-detect git repo root as working directory
      git_repo_cwd = true,
    },
  },
}
