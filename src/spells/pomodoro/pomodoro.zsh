# send instructions to pomodoro tmux session without attaching to it
pomodoro() (
  local this="$0"
  local POMODORO_REGEX="^⏳"

  local totalSeconds
  local inputTime="$1"
  shift 1
  local pomodoroLabel="${*}"

  ${this}.main() {
    totalSeconds=$(${zsb}.pomodoro.convertToSeconds "$inputTime")

    ${zsb}.pomodoro.validateSeconds "$totalSeconds"

    ${this}.createPomodoroTmuxSession

    if ${this}.isPomodoroRunning; then
      ${zsb}.throw "A pomodoro timer is already running."
    fi

    ${this}.clearPomodoroSessionTty

    ${this}.beginPomodoro

    echo "${ZSB_SUCCESS} Pomodoro started."
    return 0
  }

  ${this}.createPomodoroTmuxSession() {
    if ! $(tmux has-session -t pomodoro 2>/dev/null); then
      tmux new -d -s pomodoro
    fi
  }

  ${this}.isPomodoroRunning() {
    local lastPomodoroLines=$(tmux capture-pane -p -t pomodoro | sed '/^$/d' | tail -1)
    ${zsb}.doesMatch "$lastPomodoroLines" "$POMODORO_REGEX"
  }

  ${this}.clearPomodoroSessionTty() tmux send-keys -t pomodoro.0 C-g

  ${this}.beginPomodoro() {
    # the white space at the beginning is to
    # skip it from being saved to zsh history
    local pomodoroCmd=" ${zsb}.pomodoro.startPomodoro $totalSeconds $inputTime '$pomodoroLabel'"
    tmux send-keys -t pomodoro.0 "$pomodoroCmd" ENTER
  }

  ${this}.main "$@"
)
