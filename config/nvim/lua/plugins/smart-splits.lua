return {
  "mrjones2014/smart-splits.nvim",
  version = ">=1.0.0",
  config = function()
    require("smart-splits").setup({
      -- Integration with tmux
      at_edge = "wrap",
    })

    local keymap = vim.keymap

    -- Resize splits with Cmd+Ctrl+[hjkl] - works in normal and terminal mode
    keymap.set("n", "<D-C-h>", require("smart-splits").resize_left, { desc = "Resize split left" })
    keymap.set("n", "<D-C-j>", require("smart-splits").resize_down, { desc = "Resize split down" })
    keymap.set("n", "<D-C-k>", require("smart-splits").resize_up, { desc = "Resize split up" })
    keymap.set("n", "<D-C-l>", require("smart-splits").resize_right, { desc = "Resize split right" })

    keymap.set("t", "<D-C-h>", require("smart-splits").resize_left, { desc = "Resize split left" })
    keymap.set("t", "<D-C-j>", require("smart-splits").resize_down, { desc = "Resize split down" })
    keymap.set("t", "<D-C-k>", require("smart-splits").resize_up, { desc = "Resize split up" })
    keymap.set("t", "<D-C-l>", require("smart-splits").resize_right, { desc = "Resize split right" })
  end,
}
