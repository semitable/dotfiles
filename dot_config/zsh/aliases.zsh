if command -v nala 2>&1 > /dev/null; then
    alias sudo='sudo '
    alias apt="nala"
    alias apt-get="nala"
fi

alias mux="tmuxinator"
alias myip='curl http://ipecho.net/plain; echo'
alias distro='cat /etc/*-release'
alias ffs='sudo $(fc -ln -1)'
alias please='sudo $(fc -ln -1)'

alias ls='ls --color=auto'
alias ll="ls -alrtF --color"
alias ..='cd ..'
alias ...='cd ..;cd ..'
alias ~='cd ~'
