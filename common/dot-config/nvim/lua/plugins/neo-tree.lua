return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  cmd = "Neotree",
  keys = {
    { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Toggle file tree" },
    { "<leader>o", "<cmd>Neotree focus<cr>", desc = "Focus file tree" },
    { "<leader>gs", "<cmd>Neotree git_status toggle<cr>", desc = "Git changed files" },
    { "<leader>sy", "<cmd>Neotree document_symbols toggle<cr>", desc = "Symbol outline" },
  },
  opts = {
    close_if_last_window = true,
    sources = { "filesystem", "buffers", "git_status", "document_symbols" },
    filesystem = {
      follow_current_file = { enabled = true },
      use_libuv_file_watcher = true,
      filtered_items = {
        visible = true,
        hide_dotfiles = false,
        hide_gitignored = false,
      },
    },
    window = {
      position = "left",
      width = 32,
      mappings = {
        ["<space>"] = "none",
      },
    },
    default_component_configs = {
      indent = { with_markers = true },
      git_status = {
        symbols = {
          added = "+",
          modified = "~",
          deleted = "-",
          renamed = "→",
        },
      },
    },
  },
}
