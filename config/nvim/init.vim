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

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

" Load bundles
if filereadable(expand("~/.config/nvim/bundles.vim"))
  source ~/.config/nvim/bundles.vim
endif

" Color scheme
color github
let g:airline_theme='base16'

" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1
highlight ColorColumn ctermbg=255 guibg=#ECECEC

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
  \{'d': '~/dotfiles'},
  \{'v': '~/.vimrc'},
  \{'z': '~/.zshrc'}
  \]

" cntl-p configuration
" https://github.com/kien/ctrlp.vim
"
" Improve ctrlp matches with ctrlp-py-matcher
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
" have cntlp reuse the startify window on startup
let g:ctrlp_reuse_window = 'startify'
" search the nearest ancestor w/ vcs dir
let g:ctrlp_working_path_mode = 'r'
" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  let g:ackprg = 'ag --vimgrep' " Use ag in ack.vim
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag -Q -l -w --nocolor --hidden -g "" %s'
  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" ale
" https://github.com/w0rp/ale

let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['prettier']
let g:ale_javascript_prettier_options = '--single-quote --trailing-comma es5'

let g:ale_linters = {}
let g:ale_linters['javascript'] = ['eslint']

let g:ale_fix_on_save = 1

let g:ale_sign_error = '✖︎'
let g:ale_sign_warning = '⚠️'

" vim-jsx
" https://github.com/mxw/vim-jsx
let g:jsx_ext_required = 0 " Highlight jsx in .js files

" Avoid escape
:imap jj <Esc>
:imap jk <Esc>
:imap kk <Esc>

" Spell check
"
" Set spellfile to location that is guaranteed to exist, can be symlinked to
" Dropbox or kept in Git and managed using rcm.
set spellfile=$HOME/.vim-spell-en.utf-8.add
set spell

" deoplete
call deoplete#enable()

" deoplete-ternjs
let g:tern#command = ["tern"]
let g:tern#filetypes = ['jsx', 'javascript.jsx']

" Whether to include documentation strings (if found) in the result data.
let g:deoplete#sources#ternjs#docs = 1

" Whether to include the types of the completions in the result data. Default: 0
let g:deoplete#sources#ternjs#types = 1

" Markdown
let g:markdown_fenced_languages = ['html', 'coffee', 'json', 'javascript',
  \'js=javascript', 'python', 'bash=sh']
" Align GitHub-flavored Markdown tables
au FileType markdown vmap <Leader><Bslash> :EasyAlign*<Bar><Enter>

" Normalize white space
function! NormalizeWhitespace()
  " Save search and cursor position
  let last_search = @/
  let line = line(".")
  let col = col(".")

  " Remove trailing whitespace
  " Source: http://vim.wikia.com/wiki/Remove_unwanted_spaces
  %s#\\s\\+$##e"

  " Remove extra blank lines
  " Source: http://unix.stackexchange.com/questions/12812
  %!cat -s

  " Remove extra blank lines at end of file
  " Source: http://stackoverflow.com/questions/7495932
  %s#\($\n\s*\)\+\%$##e

  " Restore search and cursor position
  let @/ = last_search
  call cursor(line, col)
endfunction

augroup fmt
  autocmd!
  autocmd BufWritePre * :call NormalizeWhitespace()
augroup END

" Local config
if filereadable($HOME . "/.config/nvim/init.local.vim")
  source ~/.config/nvim/init.local.vim
endif
