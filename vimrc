if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

set colorcolumn=80
colorscheme github
highlight ColorColumn ctermbg=255 guibg=#ECECEC

