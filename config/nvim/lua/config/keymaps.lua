local keymap = vim.keymap

-- Use Ctrl-[hjkl] to navigate between splits
keymap.set("n", "<C-k>", "<Cmd>wincmd k<CR>", { silent = true, desc = "Move to the above split" })
keymap.set("n", "<C-j>", "<Cmd>wincmd j<CR>", { silent = true, desc = "Move to the below split" })
keymap.set("n", "<C-h>", "<Cmd>wincmd h<CR>", { silent = true, desc = "Move to the left split" })
keymap.set("n", "<C-l>", "<Cmd>wincmd l<CR>", { silent = true, desc = "Move to the right split" })

-- Use Ctrl-[hjkl] to navigate out of terminal mode
keymap.set("t", "<C-k>", "<C-\\><C-n><Cmd>wincmd k<CR>", { silent = true, desc = "Exit terminal and move to above split" })
keymap.set("t", "<C-j>", "<C-\\><C-n><Cmd>wincmd j<CR>", { silent = true, desc = "Exit terminal and move to below split" })
keymap.set("t", "<C-h>", "<C-\\><C-n><Cmd>wincmd h<CR>", { silent = true, desc = "Exit terminal and move to left split" })
keymap.set("t", "<C-l>", "<C-\\><C-n><Cmd>wincmd l<CR>", { silent = true, desc = "Exit terminal and move to right split" })

-- Easy escape from terminal mode to normal mode
keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { silent = true, desc = "Exit terminal mode" })

-- Search on highlighted text in visual mode with "//"
keymap.set("v", "//", 'y/<C-R>"<CR>', { noremap = true, silent = true, desc = "Search highlighted text" })

-- Clear the highlighted search terms with "//"
keymap.set("n", "//", ":nohlsearch<Bar>:echo<CR>", { noremap = true, silent = true, desc = "Clear search highlights" })

-- Easy access to lazy.vim
keymap.set("n", "<Leader>l", ":Lazy", { silent = true, desc = "Open lazy.vim" })
