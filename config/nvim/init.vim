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

" Lightline
let g:lightline = {
\ 'colorscheme': 'wombat',
\ 'active': {
\   'left': [['mode', 'paste'], ['filename', 'modified']],
\   'right': [['lineinfo'], ['percent'], ['readonly', 'linter_warnings', 'linter_errors', 'linter_ok']]
\ },
\ 'component_expand': {
\   'linter_warnings': 'LightlineLinterWarnings',
\   'linter_errors': 'LightlineLinterErrors',
\   'linter_ok': 'LightlineLinterOK'
\ },
\ 'component_type': {
\   'readonly': 'error',
\   'linter_warnings': 'warning',
\   'linter_errors': 'error'
\ },
\ }

function! LightlineLinterWarnings() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d ◆', all_non_errors)
endfunction

function! LightlineLinterErrors() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d ✗', all_errors)
endfunction

function! LightlineLinterOK() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '✓ ' : ''
endfunction

autocmd User ALELint call s:MaybeUpdateLightline()

" Update and show lightline but only if it's visible (e.g., not in Goyo)
function! s:MaybeUpdateLightline()
  if exists('#lightline')
    call lightline#update()
  end
endfunction

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

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" Advanced customization using autoload functions
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})

" ale
" https://github.com/w0rp/ale

let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['prettier']
let g:ale_fixers['json'] = ['prettier']
let g:ale_javascript_prettier_use_local_config = 1
let g:ale_linters = {}
let g:ale_linters['javascript'] = ['eslint']
let g:ale_linters['json'] = ['jsonlint']

let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 0

highlight link ALEWarningSign String
highlight link ALEErrorSign Title

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

" deoplete
let g:deoplete#enable_at_startup = 1
" Use <tab> to complete
inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" Fix deoplete + multiple cursors conflict
" https://github.com/terryma/vim-multiple-cursors/issues/235
func! Multiple_cursors_before()
    call deoplete#init#_disable()
endfunc

func! Multiple_cursors_after()
    call deoplete#init#_enable()
endfunc

" supertab
" https://github.com/ervandew/supertab
let g:SuperTabDefaultCompletionType = "<c-n>" " Cycle from top to bottom

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
