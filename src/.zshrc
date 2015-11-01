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

# Load Aliases
ALIASFILE=~/.aliases
if [[ -a $ALIASFILE ]];
then 
    source $ALIASFILE;
fi

# Override soft rm 
alias rm='nocorrect rm'
alias r='`fc -nl -1`'
