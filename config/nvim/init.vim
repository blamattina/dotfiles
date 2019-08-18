" set character encoding
scriptencoding utf-8
set encoding=utf-8

" set leader to space
let mapleader = " "

" set terminal title
set title
set titleold=""
set titlestring=vim\ %F

if $TERM =~# '^\%(screen\|tmux\)'
  let &t_ts = "\e]2;" " Set pane title in tmux
endif

set backspace=2  " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile   " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=50
set ruler        " show the cursor position all the time
set showcmd      " display incomplete commands

set laststatus=2 " Always display the status line
set autowrite    " Automatically :write before running commands

" Searching
set incsearch    " do incremental searching
set ignorecase   " and ignore case
set smartcase    " unless explicitly Uppercase
set hlsearch     " highlight search terms

" Search on highlighted text in visual mode with "//"
vnoremap // y/<C-R>"<CR>

" Clear the highlighted search terms with "//"
nnoremap // :nohlsearch<Bar>:echo<CR>

" Terminal mode
"
" Use escape to return to normal mode:
:tnoremap <Esc> <C-\><C-n>

" Use `CTRL+{h,j,k,l}` to navigate in terminal mode:
:tnoremap <C-h> <C-\><C-N><C-w>h
:tnoremap <C-j> <C-\><C-N><C-w>j
:tnoremap <C-k> <C-\><C-N><C-w>k
:tnoremap <C-l> <C-\><C-N><C-w>l

" Load bundles
if filereadable(expand("~/.config/nvim/bundles.vim"))
  source ~/.config/nvim/bundles.vim
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.

" Color scheme
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

color one
set background=light

" Improve diff colors
hi diffadd gui=none guifg=none guibg=#bada9f
hi diffchange gui=none guifg=none guibg=#e5d5ac
hi diffdelete gui=bold guifg=#ff8080 guibg=#ffb0b0
hi difftext gui=none guifg=none guibg=#8cbee2

" Soft tabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Display extra white space
set list listchars=tab:»·,trail:·,nbsp:·

" Use one space, not two, after punctuation.
set nojoinspaces

" Numbers
set number
set numberwidth=5
set relativenumber

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Quicker window movement
let g:tmux_navigator_no_mappings = 1
let g:tmux_navigator_save_on_switch = 1

nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
nnoremap <silent> <C-\> :TmuxNavigatePrevious<cr>

" Always use vertical diffs
set diffopt+=vertical

" Startify Configuration
" https://github.com/mhinz/vim-startify
"
" dont change directory when opening a file
let g:startify_change_to_dir = 0
" Use boxed quotes
let g:startify_custom_header = startify#fortune#boxed()
" Limit files in each list
let g:startify_files_number = 5
" Start indices from 1 instead of 0
let g:startify_custom_indices = map(range(1,100), 'string(v:val)')
" Links to common files
let g:startify_bookmarks = [
  \{'a': '~/.aliases'},
  \{'b': '~/.config/nvim/bundles.vim'},
  \{'i': '~/.config/nvim/init.vim'},
  \{'z': '~/.zshrc'}
  \]

" ack.vim
" Use ag instead of ack
let g:ackprg = 'ag --vimgrep'
" Highlight search terms
let g:ackhighlight = 1
let g:ack_use_dispatch = 0

" fzf.vim
let $FZF_DEFAULT_COMMAND = 'ag -g ""'
nnoremap <C-p> :Files<cr>
nnoremap <leader>c :Commits<cr>

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Enable jsdoc syntax highlighting
let g:javascript_plugin_jsdoc = 1

" GitGutter
let g:gitgutter_sign_added = '∙'
let g:gitgutter_sign_modified = '∙'
let g:gitgutter_sign_removed = '∙'
let g:gitgutter_sign_modified_removed = '∙'

" vim-jsx
" https://github.com/mxw/vim-jsx
autocmd BufNewFile,BufRead *.js set ft=javascript.jsx

" Avoid escape
:imap jk <Esc>

" Spell check
"
" Set spellfile to location that is guaranteed to exist, can be symlinked to
" Dropbox or kept in Git and managed using rcm.
set spellfile=$HOME/.vim-spell-en.utf-8.add
set spell

" Markdown
let g:markdown_fenced_languages = ['html', 'coffee', 'json', 'javascript',
  \'js=javascript', 'python', 'bash=sh']
" Align GitHub-flavored Markdown tables
au FileType markdown vmap <Leader><Bslash> :EasyAlign*<Bar><Enter>

" Create directories if needed
autocmd BufWritePre * :silent !mkdir -p %:p:h

" Configure linting
if filereadable($HOME . "/.config/nvim/linting.vim")
  source ~/.config/nvim/linting.vim
endif

" Configure autocomplete
if filereadable($HOME . "/.config/nvim/autocomplete.vim")
  source ~/.config/nvim/autocomplete.vim
endif

" Local config
if filereadable($HOME . "/.config/nvim/init.local.vim")
  source ~/.config/nvim/init.local.vim
endif
