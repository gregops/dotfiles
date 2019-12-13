# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh
export TERM="xterm-256color"

# Set the theme
# ZSH_THEME="powerlevel9k/powerlevel9k"
ZSH_THEME=powerlevel10k/powerlevel10k
POWERLEVEL9K_MODE="nerdfont-complete"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(command_execution_time status)
POWERLEVEL9K_VI_INSERT_MODE_STRING="I"
POWERLEVEL9K_VI_COMMAND_MODE_STRING="N"
POWERLEVEL9K_VI_MODE_INSERT_BACKGROUND="197"
POWERLEVEL9K_VI_MODE_INSERT_FOREGROUND="255"
POWERLEVEL9K_VI_MODE_NORMAL_BACKGROUND="245"
POWERLEVEL9K_VI_MODE_NORMAL_FOREGROUND="000"
POWERLEVEL9K_DIR_HOME_BACKGROUND="110"
POWERLEVEL9K_CONTEXT_REMOTE_BACKGROUND="025"
POWERLEVEL9K_CONTEXT_REMOTE_FOREGROUND="255"
POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND="237"
POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND="255"
POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=0
KEYTIMEOUT=1

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

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# plugins=(autojump brew gem osx rails ruby web-search docker zsh-autosuggestions)
# plugins=(autojump brew gem osx rails ruby web-search docker)
plugins=(autojump brew osx docker)

test -f /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh && source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# User configuration
export PATH="/usr/local/opt/ruby/bin:${PATH}:${HOME}/bin:/usr/local/sbin"
export MANPATH="/usr/local/share/man:$MANPATH"
source $ZSH/oh-my-zsh.sh

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
export HIST_STAMPS="yyyy-mm-dd"
export HISTSIZE=999999999
export SAVEHIST=999999999

export LANG=en_US.UTF-8
export EDITOR=nvim
export GPG_TTY=$(tty)

# Git fast-forward function
function gff() {
  if [ -z "$1" -o -z "$2" ]; then
    echo "Use: gff <source branch> <target branch>"
    return
  fi
  git push . ${1}:${2} && git push origin ${2}
}

function tre() {
  tree -aC -I '.git|node_modules|bower_components' --dirsfirst "$@" | less -FRNX;
}

# Git aliases
alias gpl="git pull"
alias gps="git push"
alias gc="git commit -am"
alias gd="git diff"
alias gs="git status"
alias ga="git add"
alias gco="git checkout"
alias gt="git tag"

# Vagrant aliases
alias vp="vagrant provision"
alias vs="vagrant status"
alias vgs="vagrant global-status"
alias vssh="vagrant ssh"

# Other aliases
alias vim=nvim
alias t=todolist
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"
alias flush="dscacheutil -flushcache && killall -HUP mDNSResponder"
alias lock="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"
alias k=kubectl
alias tf=terraform
alias tg=terragrunt
alias npmgl="npm list -g --depth=0"
alias npml="npm list --depth=0"
alias di="docker images"
alias dps="docker ps"

export NVM_DIR="$HOME/.nvm"
test -s "/usr/local/opt/nvm/nvm.sh" && . "/usr/local/opt/nvm/nvm.sh"

# Change cursor shape for different vi modes.
# function zle-keymap-select {
#   if [[ ${KEYMAP} == vicmd ]] ||
#      [[ $1 = 'block' ]]; then
#     echo -ne '\e[2 q'
#   elif [[ ${KEYMAP} == main ]] ||
#        [[ ${KEYMAP} == viins ]] ||
#        [[ ${KEYMAP} = '' ]] ||
#        [[ $1 = 'beam' ]]; then
#     echo -ne '\e[6 q'
#   fi
# }
# zle -N zle-keymap-select
# zle-line-init() {
#     zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
#     echo -ne "\e[6 q"
# }
# zle -N zle-line-init
# echo -ne '\e[6 q' # Use beam shape cursor on startup.
# preexec() { echo -ne '\e[6 q' ;} # Use beam shape cursor for each new prompt.

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' matcher-list ''
zstyle :compinstall filename '~/.zshrc'
autoload -Uz compinit
compinit
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
bindkey '^i' expand-or-complete-prefix
export NVM_DIR="$HOME/.nvm"
test -f /usr/local/opt/nvm/nvm.sh && . /usr/local/opt/nvm/nvm.sh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export GPG_TTY=$(tty)
test -f ~/.zshrc.local && . ~/.zshrc.local
