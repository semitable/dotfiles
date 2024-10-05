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

alias ls='eza'
alias ll='eza -al --sort=modified --group-directories-first'
# alias ls='ls --color=auto'
# alias ll="ls -alrtF --color"
alias ..='cd ..'
alias ...='cd ..;cd ..'
alias ~='cd ~'


fzf-kill-process() {
  # Use ps to list processes, filter columns, pipe through fzf, then extract PID and kill
  local pid
  pid=$(ps -eo pid,comm,user,%cpu,%mem --sort=-%cpu | fzf --header="Select process to kill" | awk '{print $1}')

  if [[ -n "$pid" ]]; then
    kill -9 "$pid" && echo "Process $pid killed."
  else
    echo "No process selected."
  fi
}
