call plug#begin('~/.vim/bundle')

" visual
Plug 'mhinz/vim-startify'
Plug 'rakr/vim-one'
Plug 'vim-airline/vim-airline'

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
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'jreybert/vimagit'
Plug 'airblade/vim-gitgutter'

" Asynchronous jobs
Plug 'tpope/vim-dispatch'
Plug 'radenling/vim-dispatch-neovim'

" system
Plug 'tpope/vim-eunuch'

" JavaScript
Plug 'moll/vim-node'
Plug 'kchmck/vim-coffee-script'
Plug 'mtscout6/vim-cjsx'
Plug 'digitaltoad/vim-jade'
Plug 'mxw/vim-jsx', { 'for': ['javascript', 'markdown'] }
Plug 'othree/yajs.vim', { 'for': ['javascript', 'markdown'] }
Plug 'othree/es.next.syntax.vim', { 'for': ['javascript', 'markdown'] }
Plug 'mustache/vim-mustache-handlebars'
Plug 'tpope/vim-jdaddy'
Plug 'ternjs/tern_for_vim'

" languages
Plug 'rodjek/vim-puppet'

if filereadable(expand("~/.vimrc.bundles.local"))
  source ~/.vimrc.bundles.local
endif

call plug#end()
