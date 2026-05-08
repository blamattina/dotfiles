alias vim nvim

# tmux
alias ts "tmux start-server"
alias tk "tmux kill-server"

# tmuxifier
alias tl "tmuxifier list"
alias tls "tmuxifier load-session"
alias tlw "tmuxifier load-window"

# ag
alias agf "ag -l -G"
alias agu "ag -u"
alias aguf "ag -u -l -G"

# git
alias gc "git commit -v"
alias gco "git checkout"
alias gfa "git fetch --all"
alias gpr "git pull --rebase"
alias gmom "git merge origin/master"
alias gp "git push"

# git log: short
alias gl "git log --pretty=colored"
alias glg "git log --pretty=colored --graph"
alias gls "git log --pretty=colored --stat"

# git log: complete
alias gll "git log"
alias glgg "git log --graph"
alias glss "git log --stat"

# git functions
alias gsd git-safety-dance
alias glmb git-list-merged-branches
alias gdmb git-delete-merged-branches
alias fco fzf-checkout

# diff
alias gd "pipe-git-command-to-diff-so-fancy diff --color"
alias gdc "pipe-git-command-to-diff-so-fancy diff --color --cached"
alias gds "pipe-git-command-to-diff-so-fancy diff --color --staged"

# show
alias gs "pipe-git-command-to-diff-so-fancy show --color"
