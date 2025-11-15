local keymap = vim.keymap

-- Note: Ctrl-[hjkl] split navigation is now handled by smart-splits.nvim
-- for seamless integration with Kitty terminal windows

-- Easy escape from terminal mode to normal mode
keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { silent = true, desc = "Exit terminal mode" })
keymap.set("t", "<C-Esc>", "<C-\\><C-n>", { silent = true, desc = "Exit terminal mode with Ctrl-Esc" })

-- Search on highlighted text in visual mode with "//"
keymap.set("v", "//", 'y/<C-R>"<CR>', { noremap = true, silent = true, desc = "Search highlighted text" })

-- Clear the highlighted search terms with "//"
keymap.set("n", "//", ":nohlsearch<Bar>:echo<CR>", { noremap = true, silent = true, desc = "Clear search highlights" })

-- Easy access to lazy.vim
keymap.set("n", "<Leader>l", ":Lazy", { silent = true, desc = "Open lazy.vim" })
