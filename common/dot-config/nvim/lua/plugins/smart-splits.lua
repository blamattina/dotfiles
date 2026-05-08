return {
  "mrjones2014/smart-splits.nvim",
  version = ">=1.0.0",
  lazy = false, -- Must load on startup for IS_NVIM variable to be set
  build = "./kitty/install-kittens.bash", -- Install Kitty integration scripts
  config = function()
    require("smart-splits").setup({
      -- Integration with Kitty terminal multiplexer
      multiplexer_integration = "kitty",
    })

    local keymap = vim.keymap

    -- Navigate between splits with Ctrl+[hjkl] - seamlessly works with Kitty windows
    keymap.set("n", "<C-h>", require("smart-splits").move_cursor_left, { desc = "Move to left split" })
    keymap.set("n", "<C-j>", require("smart-splits").move_cursor_down, { desc = "Move to split below" })
    keymap.set("n", "<C-k>", require("smart-splits").move_cursor_up, { desc = "Move to split above" })
    keymap.set("n", "<C-l>", require("smart-splits").move_cursor_right, { desc = "Move to right split" })

    keymap.set("t", "<C-h>", require("smart-splits").move_cursor_left, { desc = "Move to left split" })
    keymap.set("t", "<C-j>", require("smart-splits").move_cursor_down, { desc = "Move to split below" })
    keymap.set("t", "<C-k>", require("smart-splits").move_cursor_up, { desc = "Move to split above" })
    keymap.set("t", "<C-l>", require("smart-splits").move_cursor_right, { desc = "Move to right split" })

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
