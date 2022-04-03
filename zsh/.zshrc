if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export PATH=${PATH}:/opt/homebrew/bin
export BREW_PATH=$(brew --prefix)

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh
export TERM="xterm-256color"
export SHELL=${BREW_PATH}/bin/zsh

# Linux-specific
# export SHELL=/usr/bin/zsh
# export QT_SCALE_FACTOR=1.75
# export QT_FONT_DPI=168
# xset r rate 240 50
# alias open=xdg-open
# alias o=xdg-open
# alias open=xdg-open

# Set the theme
# ZSH_THEME="powerlevel9k/powerlevel9k"
ZSH_THEME=powerlevel10k/powerlevel10k
POWERLEVEL9K_MODE="nerdfont-complete"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs newline prompt_char)
# POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(kubecontext aws public_ip)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status command_execution_time kubecontext)
# POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(command_execution_time status)
# POWERLEVEL9K_VI_INSERT_MODE_STRING="I"
# POWERLEVEL9K_VI_COMMAND_MODE_STRING="N"
POWERLEVEL9K_VCS_SHORTEN_LENGTH=10
POWERLEVEL9K_VCS_SHORTEN_MIN_LENGTH=11
POWERLEVEL9K_VCS_SHORTEN_STRATEGY="truncate_middle"
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_to_unique"
# POWERLEVEL9K_SHORTEN_DIR_LENGTH=5
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
POWERLEVEL9K_TRANSIENT_PROMPT=always
POWERLEVEL9K_INSTANT_PROMPT=verbose
POWERLEVEL9K_DISABLE_HOT_RELOAD=true

POWERLEVEL9K_DIR_BACKGROUND="deepskyblue4"
POWERLEVEL9K_KUBECONTEXT_BACKGROUND="magenta3"
POWERLEVEL9K_STATUS_BACKGROUND="grey19"
POWERLEVEL9K_PROMPT_CHAR_BACKGROUND="grey27"

# typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIINS_CONTENT_EXPANSION=''
# typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VICMD_CONTENT_EXPANSION=''
# typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIVIS_CONTENT_EXPANSION=''
typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIINS_CONTENT_EXPANSION='$'
typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VICMD_CONTENT_EXPANSION='$'
typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIVIS_CONTENT_EXPANSION='$'
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
plugins=(autojump docker)

# test -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh && source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
test -f ${BREW_PATH}/share/zsh-autosuggestions/zsh-autosuggestions.zsh && source /${BREW_PATH}/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# test -f /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh && source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# User configuration
export GOPATH=${HOME}/.go
export PATH="${HOME}/bin:${BREW_PATH}/opt/coreutils/libexec/gnubin:${BREW_PATH}/opt/ruby/bin:${PATH}:${HOME}/.krew/bin:${BREW_PATH}/sbin:${HOME}/.cargo/bin:${HOME}/.local/bin:$GOPATH/bin:${BREW_PATH}/opt/mysql-client/bin:${BREW_PATH}/opt/curl/bin"
export MANPATH="${BREW_PATH}/share/man:$MANPATH"
source $ZSH/oh-my-zsh.sh

mkdir -p ${ZDOTDIR:-~}/.zsh_functions
fpath+=${ZDOTDIR:-~}/.zsh_functions

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
export HIST_STAMPS="yyyy-mm-dd"
export HISTSIZE=999999999
export SAVEHIST=999999999
test "$(tmux display-message -p '#S' 2>&1)" = "WORK" && export HISTFILE="${HOME}/.zsh_history_work"
setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
setopt HIST_BEEP                 # Beep when accessing nonexistent history.

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
alias gpo="git push --set-upstream origin \$(git rev-parse --abbrev-ref HEAD)"
alias gc="git commit -am"
alias gco="git checkout"
alias gd="git diff"
alias gs="git status"
alias ga="git add"
alias gco="git checkout"
alias gt="git tag"
alias gb="git rev-parse --abbrev-ref HEAD"
alias gr="git remote -v"

# Vagrant aliases
alias vp="vagrant provision"
alias vs="vagrant status"
alias vgs="vagrant global-status"
alias vssh="vagrant ssh"

# Other aliases
alias vim=nvim
alias v=nvim
alias t=todo.sh
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"
alias flush="dscacheutil -flushcache && killall -HUP mDNSResponder"
alias lock="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"
alias k=kubectl
alias kns=kubens
alias kctx=kubectx
alias tf=terraform
alias tg=terragrunt
alias npmgl="npm list -g --depth=0"
alias npml="npm list --depth=0"
alias di="docker images"
alias dps="docker ps"
alias c=clear
alias dockerprune="docker image prune --force && docker system prune -a -f --volumes"

alias ns="kubectl config set-context --current --namespace"

export TERRAGRUNT_DOWNLOAD=${HOME}/.terragrunt-cache
export TF_PLUGIN_CACHE_DIR=${HOME}/.terraform.d/plugin-cache

export NVM_DIR="$HOME/.nvm"
test -s "$NVM_DIR/nvm.sh" && . "$NVM_DIR/nvm.sh"

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[2 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[6 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[6 q"
}
zle -N zle-line-init
echo -ne '\e[6 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[6 q' ;} # Use beam shape cursor for each new prompt.

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
unsetopt nomatch
setopt rm_star_silent
# function prompt_context() {}
set -o vi
autoload -z edit-command-line
bindkey -M vicmd v edit-command-line
bindkey '^i' expand-or-complete-prefix
export NVM_DIR="$HOME/.nvm"
test -f /${BREW_PATH}/opt/nvm/nvm.sh && . /${BREW_PATH}/opt/nvm/nvm.sh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export GPG_TTY=$(tty)
test -f ~/.zshrc.local && . ~/.zshrc.local
test -f ~/.zshrc.local.work -a "${WORK}" -eq "1" && . ~/.zshrc.local.work

g() {
  grep -Iirl --exclude-dir node_modules --exclude-dir .terragrunt-cache --exclude-dir .terraform --exclude *.svg --exclude *.plist --exclude package-lock.json --exclude yarn.lock --exclude .gitignore "$@" . | fzf -0 --bind "enter:execute(nvim {})" --preview 'bat --style=numbers --color=always --line-range :500 {}'
}

gl ()
{
  git log --graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"  | \
   fzf --ansi --no-sort --reverse --tiebreak=index --preview \
   'f() { set -- $(echo -- "$@" | grep -o "[a-f0-9]\{7\}"); [ $# -eq 0 ] || git show --color=always $1 ; }; f {}' \
   --bind "shift-down:preview-down,shift-up:preview-up,pgdn:preview-page-down,pgup:preview-page-up,enter:execute:
                (grep -o '[a-f0-9]\{7\}' | head -1 |
                xargs -I % sh -c 'git show --color=never % | nvim \"+set bt=nofile\"') << 'FZF-EOF'
                {}
FZF-EOF" --preview-window=right:60%
}

urlencode() {
  old_lc_collate=$LC_COLLATE
  LC_COLLATE=C
  local length="${#1}"
  for (( i = 0; i < length; i++ )); do
    local c="${1:$i:1}"
    case $c in
      [a-zA-Z0-9.~_-]) printf '%s' "$c" ;;
      *) printf '%%%02X' "'$c" ;;
    esac
  done

  LC_COLLATE=$old_lc_collate
}

urldecode() {
  local url_encoded="${1//+/ }"
  printf '%b' "${url_encoded//%/\\x}"
}

# Chronologically latest image tag for an ECR image
lit() {
  aws ecr describe-images --repository-name $1 --query 'sort_by(imageDetails,& imagePushedAt)[-1].imageTags[0]' | tr -d "\""
}

# All image tags for an ECR image, sorted chronologically in descending order
it() {
  aws ecr describe-images --repository-name $1 --query 'reverse(sort_by(imageDetails,& imagePushedAt))[*].[imagePushedAt,imageTags]' | jq -r '.[] | reduce .[1:][] as $i ("\(.[0])"; . + ", \($i)" )'
}

curlperf() {
  curl -o /dev/null -s -w "%{time_connect} + %{time_starttransfer} = %{time_total}\n" "$1"
}

alias eksutil='kubectl get nodes --no-headers | awk '\''{print $1}'\'' | xargs -P 200 -I {} sh -c '\''echo {} ; kubectl describe node {} | grep Allocated -A 5 | grep -ve Event -ve Allocated -ve percent -ve -- ; echo '\'''
alias ekspodrequests='kubectl get pods -o custom-columns=NAME:.metadata.name,"CPU(cores)":.spec.containers[*].resources.requests.cpu,"MEMORY(bytes)":.spec.containers[*].resources.requests.memory --all-namespaces'
alias kstats='join -a1 -a2 -o 0,1.2,1.3,2.2,2.3,2.4,2.5, -e '"'"'<none>'"'"' <(kubectl top pods) <(kubectl get pods -o custom-columns=NAME:.metadata.name,"CPU_REQ(cores)":.spec.containers[*].resources.requests.cpu,"MEMORY_REQ(bytes)":.spec.containers[*].resources.requests.memory,"CPU_LIM(cores)":.spec.containers[*].resources.limits.cpu,"MEMORY_LIM(bytes)":.spec.containers[*].resources.limits.memory) | column -t -s'"'"' '"'"

kstats2() {
    ns="$1"
    printf "$ns\n"
    separator=$(printf '=%.0s' {1..50})
    printf "$separator\n"
    output=$(join -a1 -a2 -o 0,1.2,1.3,2.2,2.3,2.4,2.5, -e '<none>' \
        <(kubectl top pods -n $ns) \
        <(kubectl get -n $ns pods -o custom-columns=NAME:.metadata.name,"CPU_REQ(cores)":.spec.containers[*].resources.requests.cpu,"MEMORY_REQ(bytes)":.spec.containers[*].resources.requests.memory,"CPU_LIM(cores)":.spec.containers[*].resources.limits.cpu,"MEMORY_LIM(bytes)":.spec.containers[*].resources.limits.memory))
    totals=$(printf "%s" "$output" | awk '{s+=$2; t+=$3; u+=$4; v+=$5; w+=$6; x+=$7} END {print s" "t" "u" "v" "w" "x}')
    printf "%s\n%s\nTotals: %s\n" "$output" "$separator" "$totals" | column -t -s' '
    printf "$separator\n"
}

kgetall() {
  for i in $(kubectl api-resources --verbs=list --namespaced -o name | grep -v "events.events.k8s.io" | grep -v "events" | sort | uniq); do
    echo "Resource:" $i
    kubectl -n ${1} get --ignore-not-found ${i} -o yaml
  done
}
