# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set the theme
ZSH_THEME="agnoster"

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
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(autojump brew gem osx rails ruby web-search)

# User configuration
export PATH="~/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin"
export MANPATH="/usr/local/share/man:$MANPATH"
source $ZSH/oh-my-zsh.sh
export LANG=en_US.UTF-8
export EDITOR=vim
export GPG_TTY=$(tty)

# Git fast-forward function
function gff() {
  if [ -z "$1" -o -z "$2" ]; then
    echo "Use: gff <source branch> <target branch>"
    return
  fi
  git push . ${1}:${2} && git push origin ${2}
}

# Git aliases
alias gpl="git pull"
alias gps="git push"
alias gc="git commit -am"
alias gd="git diff"
alias gs="git status"
alias ga="git add"
alias gco="git checkout"

# Vagrant aliases
alias vp="vagrant provision"
alias vs="vagrant status"
alias vgs="vagrant global-status"
alias vssh="vagrant ssh"

# Other aliases
alias dp="unset http_proxy; unset https_proxy"
alias vim=nvim

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' matcher-list ''
zstyle :compinstall filename '~/.zshrc'
autoload -Uz compinit
compinit
HISTSIZE=999999999
SAVEHIST=999999999
setopt appendhistory autocd notify
bindkey -v
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'
unsetopt correctall
type brew >/dev/null && [[ -s $(brew --prefix)/etc/profile.d/autojump.sh  ]] && . $(brew --prefix)/etc/profile.d/autojump.sh
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
if which rbenv > /dev/null 2>&1; then eval "$(rbenv init -)"; fi
unsetopt share_history
unsetopt nomatch
setopt rm_star_silent
# function prompt_context() {}
set -o vi
autoload -z edit-command-line
bindkey -M vicmd v edit-command-line
export NVM_DIR="$HOME/.nvm"
test -f /usr/local/opt/nvm/nvm.sh && . /usr/local/opt/nvm/nvm.sh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
test -f ~/.zshrc.local && . ~/.zshrc.local
