############################
#       ZINIT SETUP        #
############################

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

if [ ! -d "$ZINIT_HOME" ]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"
fastfetch

############################
#     ZINIT PLUGINS        #
############################

zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

autoload -U compinit && compinit

eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/zen.toml)"

bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

############################
#        HISTORY           #
############################

HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

############################
#         ALIASES          #
############################

# GIT
alias gs="git status"
alias gpo="git pull origin $@"
alias gpush="git push origin $@"
alias gw="git switch $@"
alias gfo="git fetch origin $@"

# VIM/NEOVIM
alias vim="nvim"
alias nvimconfig="vim ~/.config/nvim/"

# TMUX
alias tns="tmux new -s $@"

# System
alias ls="ls --color"
alias ..="cd .."

# RSS Feed Reader
alias nb="newsboat"

eval "$(fzf --zsh)"

############################
#  LANG VERSION MANAGERS   #
############################

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export GOENV_ROOT="$HOME/.goenv"
export PATH="$GOENV_ROOT/bin:$PATH"
eval "$(goenv init -)"
export PATH="$GOROOT/bin:$PATH"
export PATH="$PATH:$GOPATH/bin"
export GOTELEMETRY=off

# THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
