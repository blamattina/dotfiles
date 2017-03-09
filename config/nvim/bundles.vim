call plug#begin('~/.vim/bundle')

" visual
Plug 'mhinz/vim-startify'
Plug 'croaky/vim-colors-github'
Plug 'itchyny/lightline.vim'

" search
Plug 'ctrlpvim/ctrlp.vim'
Plug 'FelikZ/ctrlp-py-matcher'
Plug 'rking/ag.vim'

" movement
Plug 'christoomey/vim-tmux-navigator'

" markdown
Plug 'itspriddle/vim-marked'
Plug 'tpope/vim-markdown'
Plug 'junegunn/vim-easy-align'

" editing
Plug 'tpope/vim-commentary'
Plug 'terryma/vim-multiple-cursors'
Plug 'Valloric/YouCompleteMe'

" git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'mhinz/vim-signify'

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
if executable('node')
  Plug 'marijnh/tern_for_vim', { 'do': 'npm install', 'for': ['javascript', 'coffee'] }
endif

" languages
Plug 'rodjek/vim-puppet'

" Neovim
Plug 'neomake/neomake'

if filereadable(expand("~/.vimrc.bundles.local"))
  source ~/.vimrc.bundles.local
endif

call plug#end()
