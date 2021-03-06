${zsb}.throw() {
  echo -n "${ZSB_ERROR}"; puts " $1"
  throw Error
}

${zsb}.success() { echo -n "${ZSB_SUCCESS}"; puts " $1" }

${zsb}.warning() { echo -n "${ZSB_WARNING}"; puts " $1" }

${zsb}.info() { echo -n "${ZSB_INFO}"; puts " $1" }

${zsb}.prompt() { echo -n "${ZSB_PROMPT}"; puts " $1" }

${zsb}.expected() { echo -n "${ZSB_EXPECTED}"; puts " $1" }

${zsb}.current() { echo -n "${ZSB_CURRENT}"; puts " $1" }

