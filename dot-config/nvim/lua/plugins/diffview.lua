return {
  "sindrets/diffview.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles", "DiffviewFileHistory" },
  keys = {
    { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Open diffview" },
    { "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", desc = "File history" },
    { "<leader>gH", "<cmd>DiffviewFileHistory<cr>", desc = "Repo history" },
  },
  opts = {
    diff_binaries = false,
    enhanced_diff_hl = true,
    use_icons = true,
    watch_index = true,
    icons = {
      folder_closed = "",
      folder_open = "",
    },
    signs = {
      fold_closed = "",
      fold_open = "",
      done = "✓",
    },
    view = {
      default = {
        layout = "diff2_horizontal",
        winbar_info = false,
      },
      merge_tool = {
        layout = "diff3_horizontal",
        disable_diagnostics = true,
        winbar_info = true,
      },
      file_history = {
        layout = "diff2_horizontal",
        winbar_info = false,
      },
    },
    file_panel = {
      listing_style = "tree",
      tree_options = {
        flatten_dirs = true,
        folder_statuses = "only_folded",
      },
      win_config = {
        position = "left",
        width = 35,
        win_opts = {},
      },
    },
    file_history_panel = {
      log_options = {
        git = {
          single_file = {
            diff_merges = "combined",
          },
          multi_file = {
            diff_merges = "first-parent",
          },
        },
      },
      win_config = {
        position = "bottom",
        height = 16,
        win_opts = {},
      },
    },
    commit_log_panel = {
      win_config = {
        win_opts = {},
      },
    },
    default_args = {
      DiffviewOpen = {},
      DiffviewFileHistory = {},
    },
    hooks = {},
    keymaps = {
      disable_defaults = false,
      view = {
        { "n", "<tab>", "<cmd>DiffviewToggleFiles<cr>", { desc = "Toggle the file panel" } },
        {
          "n",
          "[x",
          "<cmd>lua require('diffview.actions').prev_conflict()<cr>",
          { desc = "Jump to previous conflict" },
        },
        {
          "n",
          "]x",
          "<cmd>lua require('diffview.actions').next_conflict()<cr>",
          { desc = "Jump to next conflict" },
        },
        {
          "n",
          "<leader>co",
          "<cmd>lua require('diffview.actions').conflict_choose('ours')<cr>",
          { desc = "Choose ours" },
        },
        {
          "n",
          "<leader>ct",
          "<cmd>lua require('diffview.actions').conflict_choose('theirs')<cr>",
          { desc = "Choose theirs" },
        },
        {
          "n",
          "<leader>cb",
          "<cmd>lua require('diffview.actions').conflict_choose('both')<cr>",
          { desc = "Choose both" },
        },
        {
          "n",
          "<leader>ca",
          "<cmd>lua require('diffview.actions').conflict_choose('all')<cr>",
          { desc = "Choose all" },
        },
        {
          "n",
          "dx",
          "<cmd>lua require('diffview.actions').conflict_choose('none')<cr>",
          { desc = "Delete conflict region" },
        },
      },
      file_panel = {
        { "n", "j", "<cmd>lua require('diffview.actions').next_entry()<cr>", { desc = "Next entry" } },
        { "n", "<down>", "<cmd>lua require('diffview.actions').next_entry()<cr>", { desc = "Next entry" } },
        { "n", "k", "<cmd>lua require('diffview.actions').prev_entry()<cr>", { desc = "Previous entry" } },
        { "n", "<up>", "<cmd>lua require('diffview.actions').prev_entry()<cr>", { desc = "Previous entry" } },
        { "n", "<cr>", "<cmd>lua require('diffview.actions').select_entry()<cr>", { desc = "Open the diff" } },
        { "n", "s", "<cmd>lua require('diffview.actions').toggle_stage_entry()<cr>", { desc = "Stage/unstage" } },
        { "n", "S", "<cmd>lua require('diffview.actions').stage_all()<cr>", { desc = "Stage all entries" } },
        { "n", "U", "<cmd>lua require('diffview.actions').unstage_all()<cr>", { desc = "Unstage all entries" } },
        {
          "n",
          "R",
          "<cmd>lua require('diffview.actions').refresh_files()<cr>",
          { desc = "Update stats and entries" },
        },
        { "n", "<tab>", "<cmd>lua require('diffview.actions').select_next_entry()<cr>", { desc = "Next file" } },
        {
          "n",
          "<s-tab>",
          "<cmd>lua require('diffview.actions').select_prev_entry()<cr>",
          { desc = "Previous file" },
        },
        { "n", "gf", "<cmd>lua require('diffview.actions').goto_file()<cr>", { desc = "Open file" } },
        {
          "n",
          "<C-w><C-f>",
          "<cmd>lua require('diffview.actions').goto_file_split()<cr>",
          { desc = "Open file in split" },
        },
        { "n", "i", "<cmd>lua require('diffview.actions').listing_style()<cr>", { desc = "Toggle listing style" } },
        {
          "n",
          "f",
          "<cmd>lua require('diffview.actions').toggle_flatten_dirs()<cr>",
          { desc = "Flatten empty dirs" },
        },
        { "n", "q", "<cmd>DiffviewClose<cr>", { desc = "Close diffview" } },
      },
      file_history_panel = {
        { "n", "g!", "<cmd>lua require('diffview.actions').options()<cr>", { desc = "Open option panel" } },
        { "n", "q", "<cmd>DiffviewClose<cr>", { desc = "Close diffview" } },
      },
      option_panel = {
        { "n", "<tab>", "<cmd>lua require('diffview.actions').select_entry()<cr>", { desc = "Change option" } },
        { "n", "q", "<cmd>lua require('diffview.actions').close()<cr>", { desc = "Close panel" } },
      },
    },
  },
}
