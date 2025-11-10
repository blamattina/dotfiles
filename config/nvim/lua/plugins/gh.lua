return {
  "ldelossa/gh.nvim",
  dependencies = {
    {
      "ldelossa/litee.nvim",
      config = function()
        require("litee.lib").setup()
      end,
    },
  },
  cmd = { "GHOpenPR", "GHSearchPRs", "GHSearchIssues", "GHOpenIssue" },
  keys = {
    { "<leader>gpr", "<cmd>GHOpenPR<cr>", desc = "Open PR for review" },
    { "<leader>gps", "<cmd>GHSearchPRs<cr>", desc = "Search PRs" },
    { "<leader>gis", "<cmd>GHSearchIssues<cr>", desc = "Search issues" },
    { "<leader>gio", "<cmd>GHOpenIssue<cr>", desc = "Open issue" },
  },
  config = function()
    require("litee.gh").setup({
      -- Enable debug logging (set to false for normal use)
      debug_logging = false,

      -- Icon set to use
      icon_set = "default",

      -- Panel orientation: "left", "right", "top", "bottom"
      panel_orientation = "right",

      -- Panel size
      panel_size = 50,

      -- Keymaps for the panel
      keymaps = {
        open = "<CR>",
        expand = "zo",
        collapse = "zc",
        goto_issue = "gi",
        details = "d",
        submit_comment = "<C-s>",
        actions = "<C-a>",
        resolve_thread = "<C-r>",
        goto_web = "gx",
      },
    })
  end,
}
