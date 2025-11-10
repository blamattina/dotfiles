return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require("lint")

    -- Configure linters for each filetype
    lint.linters_by_ft = {
      javascript = { "eslint_d" },
      javascriptreact = { "eslint_d" },
      typescript = { "eslint_d" },
      typescriptreact = { "eslint_d" },
      python = { "ruff" },
      sh = { "shellcheck" },
      bash = { "shellcheck" },
      lua = { "selene" },
    }

    -- Create autocommand group for linting
    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

    -- Trigger linting on save
    vim.api.nvim_create_autocmd({ "BufWritePost" }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end,
    })

    -- Trigger linting when leaving insert mode (for quick feedback)
    vim.api.nvim_create_autocmd({ "InsertLeave" }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end,
    })

    -- Optional: Debounced linting on text change (commented out to avoid performance issues)
    -- Uncomment if you want real-time linting as you type
    -- vim.api.nvim_create_autocmd({ "TextChanged" }, {
    --   group = lint_augroup,
    --   callback = function()
    --     vim.defer_fn(function()
    --       lint.try_lint()
    --     end, 100) -- 100ms debounce
    --   end,
    -- })

    -- Keybinding to manually trigger linting
    vim.keymap.set("n", "<leader>l", function()
      lint.try_lint()
    end, { desc = "Trigger linting for current file" })
  end,
}
