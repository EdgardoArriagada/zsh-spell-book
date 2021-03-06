gnameit() {
  # Gets userName in lowercase
  local userName="${$(git config user.name):l}"
  local oldUrl="$(git config --get remote.origin.url)"

  if [[ -z "$userName" ]]; then
    echo "${ZSB_ERROR} Username not set."; return 1
  fi

  if [[ -z "$oldUrl" ]]; then
    echo "${ZSB_ERROR} Origin url not set."; return 1
  fi

  if ${zsb}.doesMatch "$oldUrl" "^http[s]:\/{2}.+@"; then
    printf "${ZSB_INFO} Username in url is already set.
      $(hl $oldUrl) \n"
    return 0
  fi

  local regexReplacer="s/:\/{2}/:\/\/${userName}@/"
  local newUrl="$(printf "$oldUrl" | sed -E "$regexReplacer")"

  git remote set-url origin "$newUrl" && \
    printf "${ZSB_SUCCESS} Remote url changed from
      ${ZSB_COLOR_FOREGROUND_RED} - ${oldUrl}${ZSB_NO_COLOR}
      ${ZSB_COLOR_FOREGROUND_GREEN} + ${newUrl}${ZSB_NO_COLOR} \n"
}
