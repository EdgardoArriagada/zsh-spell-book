${zsb}.doesMatch() {
  local input="$1"
  local regexString="$2"
  echo -E - "$input" | grep -E -q "$regexString"
}

${zsb}.isInteger() {
  local INTEGER_REGEX="^-?[0-9]+$"
  ${zsb}.doesMatch "$1" "$INTEGER_REGEX"
}

${zsb}.isFloat() {
  local FLOAT_REGEX="^[-+]?[0-9]*\.?[0-9]+([eE][-+]?[0-9]+)?$"
  ${zsb}.doesMatch "$1" "$FLOAT_REGEX"
}

