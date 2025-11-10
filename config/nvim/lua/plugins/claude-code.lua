return {
  "greggh/claude-code.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("claude-code").setup({
      -- Toggle Claude Code with Ctrl-,
      keybind = "<C-,>",
      -- Auto reload files when Claude modifies them
      auto_reload = true,
      -- Window configuration
      window = {
        position = "botright vertical", -- vertical split on the right
        split_ratio = 0.25,             -- 25% of screen width
      },
    })
  end,
}
