return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			-- Conform will run the first available formatter
			javascript = { "prettierd", "prettier", stop_after_first = true },
		},
	},
}
