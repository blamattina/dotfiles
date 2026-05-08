return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {
		defaults = {
			file_ignore_patterns = { "^./.git/", "^node_modules/" },
		},
	},
	keys = {
		{ "<C-p>", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
		{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
	},
}
