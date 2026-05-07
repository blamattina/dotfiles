return {
  "declancm/maximize.nvim",
  config = function()
    require("maximize").setup()

    -- Toggle maximize with Cmd+Ctrl+z (works in normal and terminal mode)
    vim.keymap.set("n", "<D-C-z>", function()
      require("maximize").toggle()
    end, { desc = "Toggle maximize split" })

    vim.keymap.set("t", "<D-C-z>", function()
      require("maximize").toggle()
    end, { desc = "Toggle maximize split" })
  end,
}
