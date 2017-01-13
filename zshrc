# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# User configuration

# Load boxen environment
[[ -f /opt/boxen/env.sh ]] && source /opt/boxen/env.sh

# Load local environment
[[ -f ~/.env ]] && export $(cat ~/.env)

# Load oh-my-zsh
[[ -f $ZSH/oh-my-zsh.sh ]] && source $ZSH/oh-my-zsh.sh

# Load tmuxifier: https://github.com/jimeh/tmuxifier
export PATH="$HOME/.tmuxifier/bin:$PATH"
export TMUXIFIER_LAYOUT_PATH="$HOME/.tmux-layouts"
eval "$(tmuxifier init -)"

# neovim tmux navigator fix
# https://github.com/christoomey/vim-tmux-navigator/issues/61
infocmp $TERM | sed 's/kbs=^[hH]/kbs=\\177/' > /tmp/$TERM.ti
tic /tmp/$TERM.ti

# Set empty terminal title for tmux
printf '\033]2;\033\\'

# Set horizontal split for tmuxifier windows
if [ $COLUMNS -gt 200 ]; then
  export TMUXIFIER_HORIZONTAL_SPLIT=9
else
  export TMUXIFIER_HORIZONTAL_SPLIT=18
fi

# Set editor to vim
export EDITOR=nvim

# Load plug
if [ ! -e "$HOME"/.config/nvim/autoload/plug.vim ]; then
  curl -fLo "$HOME"/.config/nvim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

  vim -u "$HOME"/.config/nvim/bundles.vim +PlugInstall +PlugClean! +qa
fi

# Load z
if [[ -f `brew --prefix`/etc/profile.d/z.sh ]]; then
  . `brew --prefix`/etc/profile.d/z.sh
fi

# Load aliases
[[ -f ~/.aliases ]] && source ~/.aliases

# Local config
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
