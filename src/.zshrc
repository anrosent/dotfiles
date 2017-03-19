#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
    source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

PATH=$PATH:~/bin

# Load Aliases
ALIASFILE=~/.aliases
if [[ -a $ALIASFILE ]];
then 
    source $ALIASFILE;
fi

# Override soft rm 
alias rm='nocorrect rm'
alias r='`fc -nl -1`'

# ENV Stuff
export ANDROID_HOME=~/Library/Android/sdk

bindkey '^V' vi-cmd-mode

bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward

#function zle-line-init zle-keymap-select {
#    VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]%  %{$reset_color%}"
#    RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/}$(git_custom_status) $EPS1"
#    zle reset-prompt
#}

zle -N zle-line-init
zle -N zle-keymap-select
export KEYTIMEOUT=1

# Vim stuff
autoload -U read-from-minibuffer

function _index-of {
local STR=$1
local STRLEN=${#STR}
local SUBSTR=$2
local SUBSTRLEN=${#SUBSTR}
local START=${3:-0}
local DIRECTION=${4:-1}

[[ $STRLEN -ge 0 ]] || return 1
[[ $SUBSTRLEN -ge 0 ]] || return 2
[[ $START -ge 0 ]] || return 3
[[ $START -lt $STRLEN ]] || return 4
[[ $DIRECTION -eq 1 || $DIRECTION -eq -1 ]] || return 5

for ((INDEX = $START; INDEX >= 0 && INDEX < $STRLEN; INDEX = INDEX + $DIRECTION)); do
    if [[ "${STR:$INDEX:$SUBSTRLEN}" == "$SUBSTR" ]]; then
        echo $INDEX
        return
    fi
done

return -1
}

function _vi-search-forward {
read-from-minibuffer
INDEX=$(_index-of $BUFFER $REPLY $CURSOR) && CURSOR=$INDEX || INDEX=$(_index-of $BUFFER $REPLY 0) && CURSOR=$INDEX
export VISEARCHSTR=$REPLY
export VISEARCHDIRECTION=1
}

function _vi-search-forward-repeat {
INDEX=$(_index-of $BUFFER $VISEARCHSTR $(($CURSOR + 1))) && CURSOR=$INDEX || INDEX=$(_index-of $BUFFER $VISEARCHSTR 0) && CURSOR=$INDEX
}

function _vi-search-backward {
read-from-minibuffer
INDEX=$(_index-of $BUFFER $REPLY $CURSOR -1) && CURSOR=$INDEX || INDEX=$(_index-of $BUFFER $REPLY $((${#BUFFER} - 1)) -1) && CURSOR=$INDEX
export VISEARCHSTR=$REPLY
export VISEARCHDIRECTION=-1
}

function _vi-search-backward-repeat {
INDEX=$(_index-of $BUFFER $VISEARCHSTR $(($CURSOR - 1)) -1) && CURSOR=$INDEX || INDEX=$(_index-of $BUFFER $VISEARCHSTR $((${#BUFFER} - 1)) -1) && CURSOR=$INDEX
}

function _vi-search-repeat {
if [[ $VISEARCHDIRECTION -eq 1 ]]; then
    _vi-search-forward-repeat
else
    _vi-search-backward-repeat
fi
}

function _vi-search-repeat-reverse {
if [[ $VISEARCHDIRECTION -eq 1 ]]; then
    _vi-search-backward-repeat
else
    _vi-search-forward-repeat
fi
}

zle -N vi-search-backward _vi-search-backward
zle -N vi-search-forward _vi-search-forward
zle -N vi-search-repeat _vi-search-repeat
zle -N vi-search-repeat-reverse _vi-search-repeat-reverse

bindkey -M vicmd '?' vi-search-backward
bindkey -M vicmd '/' vi-search-forward
bindkey -M vicmd 'n' vi-search-repeat
bindkey -M vicmd 'N' vi-search-repeat-reverse
bindkey -s 'jk' 'A'

function install_jtags {
    npm install jsctags
    # https://github.com/mozilla/doctorjs/issues/52
    gsed -i '51i tags: [],' ./node_modules/jsctags/jsctags/ctags/index.js
}

function jtag {
    cd `git rev-parse --show-toplevel`
    if [ -f tags ]; then rm tags; fi
    find . -type f -iregex ".*\.js$" -not -path "./node_modules/*" -exec jsctags {} -f \; | sed '/^$/d' | sort > tags
}
