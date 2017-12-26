# =============
# FILES MANAGER
# =============

function files(){
  if ! is_git_repo || is_git_dir; then
    echo "fatal: Not a git repository (or any of the parent directories): .git"
    return
  fi
  local modifier_num=$1
  local action_num=$2
  local branch=$(getbranch)
  echo
  echo [FILE MANAGER]
  echo
  echo "Compare files in branch '$branch':"
  echo
  scenarios=("files modified since last commit" "files different from master" "conflicting files in current rebase")
  modifiers=("mod" "dif" "conf")
  for i in "${!scenarios[@]}"; do
      printf "$(($i + 1)): ${scenarios[$i]}\n"
  done
  echo
  local modifier_number=$(($(input "option" ${#scenarios[@]} $modifier_num) -1))
  local scenario=${scenarios[$modifier_number]}
  echo
  echo "Available options for $scenario:"
  options=("open files in text editor" "print filenames in terminal" "copy filenames to clipboard")
  actions=("edit" "cat" "copy")
  echo
  for i in "${!options[@]}"; do
      printf "$(($i + 1)): ${options[$i]}\n"
  done
  echo
  local action_number=$(($(input "action" ${#options[@]} $action_num) -1))
  eval "${actions[$action_number]}${modifiers[$modifier_number]}"
}


# ==============================================
# FUNCTIONS FOR COMPARING/EDITING MODIFIED FILES
# ==============================================

# GIT STATUS

# Copy single line list of any files modified since last commit
# Useful if you want to run them all as an argument for a single command
# example: $ rubocop <paste filenames here>
function copymod() {
  local mod
  mod=$(git status -s | cut -c4- | tr '\n' ' ')
  if [ -n "$mod" ] ; then
    git status -s | cut -c4- | tr '\n' ' ' | pbcopy
    echo "Copied filenames of all files modified since latest commit"
  else
    echo "No filenames to copy. Your haven't modiefied any files since latest commit."
  fi
}

# I think you are familiar with this one :-) [just creating alias for $(files) function]
alias catmod="git status"

# Open any files modified or created since last commit in chosen text editor (files shown in `git status`)
function editmod() {
  local mod
  mod=$(git status -s | cut -c4-)
  if [ -n "$mod" ] ; then
    echo "Opening all files modified since latest commit in ${editor}."
    echo
    while read -r line; do
      echo "edit $line"
      edit $line
    done <<< "$mod"
  else
    echo "No files to edit. Your haven't modiefied any files since latest commit."
  fi
}

# GIT DIFF

# Copy single line list of any files different from master (before rebase)
function copydif() {
  local diffs
  diffs=$(git diff -b -w --diff-filter=ACMRTU --name-only leadfeeder/master $(getbranch) | tr '\n' ' ')
  if [ -n "$diffs" ] ; then
    git diff -b -w --diff-filter=ACMRTU --name-only leadfeeder/master $(getbranch) | tr '\n' ' ' | pbcopy
    echo "Copied filenames of current branch files different from master"
  else
    echo "No filenames to copy. Your branch is up to date with master."
  fi
}

# Show any files different from master (before rebase)
function catdif() {
  local diffs
  diffs=$(git diff -b -w --diff-filter=ACMRTU --name-only leadfeeder/master $(getbranch))
  if [ -n "$diffs" ] ; then
    echo
    echo "Current branch files different from master:"
    echo
    echo $diffs |  tr ' ' '\n'
    echo
  else
    echo "No filenames to print. Your branch is up to date with master"
  fi
}

# Open any files different from master (before rebase) in chosen text editor
function editdif() {
  diffs=$(git diff -b -w --diff-filter=ACMRTU --name-only leadfeeder/master $(getbranch))
  if [ -n "$diffs" ] ; then
    echo "Opening all files with files different from master in ${editor}."
    echo
    while read -r line; do
      echo "edit $line"
      edit $line
    done <<< "$diffs"
  else
    echo "No files to edit. Your branch is up to date with master"
  fi
}

# GIT REBASE (Conflicts)

# Copy single line list of any files different from master (before rebase)
function copyconf() {
  local conf
  conf=$(git diff --name-only --diff-filter=U | tr '\n' ' ')
  if [ -n "$conf" ] ; then
    git diff --name-only --diff-filter=U | tr '\n' ' ' | pbcopy
    echo "Copied filenames of conflicts in current rebase"
  else
    echo "No filenames to copy. Zero conflicting files in current rebase"
  fi
}

# Show any conflicting files from current rebase
function catconf() {
  local conf
  conf=$(git diff --name-only --diff-filter=U | tr '\n' ' ')
  if [ -n "$conf" ] ; then
    echo
    echo "Conflicts in current rebase:"
    echo
    echo $conf |  tr ' ' '\n'
    echo
  else
    echo "No filenames to print. Zero conflicting files in current rebase"
  fi
}

# Open any conflicting files from current rebase in chosen text editor
function editconf() {
  local conf
  conf=$(git diff --name-only --diff-filter=U)
  if [ -n "$conf" ] ; then
    echo "Opening all files conflicting with rebase in ${editor}."
    echo
    while read -r line; do
      echo "edit $line"
      edit $line
    done <<< "$conf"
  else
    echo "No files to edit. Zero conflicting files in current rebase"
  fi
}
