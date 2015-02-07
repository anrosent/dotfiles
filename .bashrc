# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h: \W\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias s='ls -CF'
alias sl='ls -CF'
alias lsd='ls -d */'
alias lsl='ls -CF'
alias sls='ls -CF'

alias r="fc -s"
alias fn="find . -name"
alias u="cd .."
function rg() {
    grep -R $@ .
}

# git aliases
alias gs='git status'
alias ga='git add'
alias fa='mr *Fall'

alias fblock="sudo /home/anrosent/bin/block facebook"
alias funblock="sudo /home/anrosent/bin/unblock facebook"
alias venv="virtualenv"
alias venva="source venv/bin/activate"
alias clas="view schedule"
alias music="cd ~/media/Music/myTunes"
# rust aliases
alias cb='cargo build'

# convenient project access
alias scratch=". scratch"
alias re='E_ROOT=~/src/sourcere/reterm . e'
alias ma='E_ROOT=~/docs/matrix . e'
alias mr='E_ROOT=~/docs/matrix/matrixbook . e'
alias b='E_ROOT=$BROWN_ROOT . e'
alias se='b current'
alias todos='grep TODO '

alias pdf='quiet evince'
alias view='open_pdf'
alias pj='. brown_nav proj'
alias hw='. brown_nav hw'
alias hn='links news.ycombinator.com'
alias gfind='. _gfind'
alias me='E_ROOT=~/src . e'

alias board='xclip -sel c'

# SSH aliases
alias hookup='ssh -i ~/.ssh/hookups.pem ec2-user@54.174.14.4'

# convenient terminal styling
alias black_back='gconftool-2 --set "/apps/gnome-terminal/profiles/Default/background_color" --type string "#000000000000"'
alias white_back='gconftool-2 --set "/apps/gnome-terminal/profiles/Default/background_color" --type string "#FFFFFFFFFFFF"'
alias white_fore='gconftool-2 --set "/apps/gnome-terminal/profiles/Default/foreground_color" --type string "#FFFFFFFFFFFF"'
alias green_fore='gconftool-2 --set "/apps/gnome-terminal/profiles/Default/foreground_color" --type string "#0000FFFF0000"'

# convenient program starting
alias rustup='sudo ~/bin/rustup'
alias chrome='quiet google-chrome'
alias spot='quiet spotify'
alias skype='quiet skype'

alias lolenable='lolcommits --enable --fork'


# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
export PATH=$PATH:~/lib/swift-0.94.1/bin

#For CS32
export JAVA_HOME="/pro/java/linux/jdk1.8.0_05"
export PATH="$JAVA_HOME/bin:$PATH"
export GOPATH="~/src/go"
export PATH="$GOPATH/bin:$PATH"

#For matrix TA
export PATH=$PATH":/usr/local/google_appengine"
export PATH=$PATH":/home/anrosent/docs/matrix/bin"

export PATH=$PATH:/usr/local/AWS-ElasticBeanstalk-CLI-2.6.3/eb/linux/python2.7/

export SOURCERE_SUPPORT_PATH="$HOME/src/sourcere/reterm/support"
export PATH=$PATH:$SOURCERE_SUPPORT_PATH/scripts

#Brown course navigation
export BROWN_ROOT="$HOME/docs/brown"
