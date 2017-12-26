# Git status information
is_git_repo() {
    $(git rev-parse --is-inside-work-tree &> /dev/null)
}
is_git_dir() {
    $(git rev-parse --is-inside-git-dir 2> /dev/null)
}


# input method for git/files manager functions

input(){
  local object_selecting=$1
  local num_of_selections=$2
  local selection=$3
  until [[ $selection =~ ^-?[0-9]+$ ]] && (( selection >= 1 && selection <= num_of_selections )); do
    echo
    if [[ $selection = "q" ]]; then
      return
    fi
    if [[ ! -z $selection ]]; then
      echo Please enter a number between [ 1 - $((${num_of_selections})) ] >&2
    else
      echo Select $object_selecting >&2
    fi
    read selection
  done
  echo $selection
}
