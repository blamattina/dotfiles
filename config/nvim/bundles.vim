call plug#begin('~/.config/nvim/plugged')

" visual
Plug 'mhinz/vim-startify'
Plug 'rakr/vim-one'
Plug 'itchyny/lightline.vim'

" search
Plug 'mileszs/ack.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" movement
Plug 'christoomey/vim-tmux-navigator'

" markdown
Plug 'itspriddle/vim-marked'
Plug 'tpope/vim-markdown'
Plug 'junegunn/vim-easy-align'

" editing
Plug 'w0rp/ale'
Plug 'tpope/vim-commentary'
Plug 'terryma/vim-multiple-cursors'

" autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" git
Plug 'airblade/vim-gitgutter'
Plug 'jreybert/vimagit'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

" languages
Plug 'digitaltoad/vim-jade'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-jdaddy'

Plug 'xavierchow/vim-sequence-diagram'

if filereadable($HOME . "/.config/nvim/bundles.local.vim")
  source ~/.config/nvim/bundles.local.vim
endif

call plug#end()
