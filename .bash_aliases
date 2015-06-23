# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias s='ls -CF'
alias sl='ls -CF'
alias lsd='ls -d */'
alias lsl='ls -CF'
alias sls='ls -CF'
alias c='cd'

alias v='vim'
alias r="fc -s"
alias fn="find . -name"
alias u="cd .."
alias rg="rgrep"
alias brown-vpn="sudo openvpn ~/vpn/brown/browncs-gateall.ovpn"

# git aliases
alias gs='git status'
alias ga='git add'
alias fa='mr *Fall'

alias fblock="sudo /home/anrosent/bin/block facebook"
alias funblock="sudo /home/anrosent/bin/unblock facebook"
alias venv="virtualenv -p /usr/bin/python3 venv"
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

