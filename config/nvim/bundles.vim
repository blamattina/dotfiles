call plug#begin('~/.vim/bundle')

" visual
Plug 'mhinz/vim-startify'
Plug 'rakr/vim-one'
Plug 'itchyny/lightline.vim'

" search
Plug 'ctrlpvim/ctrlp.vim'
Plug 'FelikZ/ctrlp-py-matcher'
Plug 'mileszs/ack.vim'

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
function! SetupDeoplete(info)
  " info is a dictionary with 3 fields
  " - name:   name of the plugin
  " - status: 'installed', 'updated', or 'unchanged'
  " - force:  set on PlugInstall! or PlugUpdate!
  if a:info.status == 'installed' || a:info.force
    !pip3 install neovim
    :UpdateRemotePlugins
  endif
endfunction
Plug 'Shougo/deoplete.nvim', { 'do': function('SetupDeoplete')  }
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }

" git
Plug 'airblade/vim-gitgutter'
Plug 'jreybert/vimagit'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

" Asynchronous jobs
Plug 'radenling/vim-dispatch-neovim'
Plug 'tpope/vim-dispatch'

" languages
Plug 'digitaltoad/vim-jade'
Plug 'sheerun/vim-polyglot'
Plug 'ternjs/tern_for_vim'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-jdaddy'

if filereadable(expand("~/.vimrc.bundles.local"))
  source ~/.vimrc.bundles.local
endif

call plug#end()
