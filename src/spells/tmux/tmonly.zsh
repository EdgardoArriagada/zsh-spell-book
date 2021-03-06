tmonly() {
  local -r tmuxList=( $(tmls) )
  local -r currentSession=( "$(tmux display-message -p '#S')" )
  local -r otherSessions=${tmuxList:|currentSession}

  [[ -z "$otherSessions" ]] && ${zsb}.info "There are no other sessions." && return 0

  ${zsb}.warning "You are about to kill the following sessions"
  echo "$(hl "$otherSessions")"
  ${zsb}.prompt "Are you sure? [Y/n]"

  ${zsb}.confirmMenu && tmux kill-session -a
}

_${zsb}.nocompletion tmonly
