gd() {
  if [ -z "$1" ]; then
    git diff && ${zsb}_gitStatus
    return 0
  fi

  git diff "$@" && ${zsb}_gitStatus
  return 0
}

# Complete with unstaged files
complete -C "git status --short | grep -E '(^ [MARCD])|(^[MARCD]{2})' | sed s/^...//" gd
