-- Auto-format on save
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})

-- Set IS_NVIM variable in Kitty for smart-splits integration
-- This tells Kitty to pass through navigation keys to Neovim
if vim.env.KITTY_LISTEN_ON then
	vim.api.nvim_create_autocmd({ "VimEnter", "VimResume" }, {
		group = vim.api.nvim_create_augroup("KittySetVarVimEnter", { clear = true }),
		callback = function()
			io.stdout:write("\x1b]1337;SetUserVar=IS_NVIM=MQo\007")
		end,
	})

	vim.api.nvim_create_autocmd({ "VimLeave", "VimSuspend" }, {
		group = vim.api.nvim_create_augroup("KittyUnsetVarVimLeave", { clear = true }),
		callback = function()
			io.stdout:write("\x1b]1337;SetUserVar=IS_NVIM\007")
		end,
	})
end
