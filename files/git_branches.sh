# ================
# BRANCHES MANAGER
# ================

function branches(){
  if ! is_git_repo || is_git_dir; then
    echo "fatal: Not a git repository (or any of the parent directories): .git"
    return
  fi
  local branch_num=$1
  local option_num=$2
  branches=()
  eval "$(git for-each-ref --shell --sort='-*committerdate' --format='branches+=(%(refname:short))' refs/heads/)"

  echo
  echo [BRANCHES MANAGER]
  echo
  echo Listing branches by most recent commit:
  echo
  for i in "${!branches[@]}"; do
      printf "$(($i + 1)): ${branches[$i]}\n"
  done
  echo
  local branch_number=$(($(input "branch" ${#branches[@]} $branch_num) -1))
  local branch=${branches[$branch_number]}
  echo
  echo "Selected branch '$branch'"
  options=("Checkout branch" "Checkout branch and open branch manager" "Checkout branch in all affected Leadfeeder Repos" "Copy branch name to clipboard" "Delete branch [WARNING]")
  operations=("git checkout $branch" "git checkout $branch && branch" "checkoutall $branch" "copybranch" "git branch -D $branch")
  echo
  for i in "${!options[@]}"; do
      printf "$(($i + 1)): ${options[$i]}\n"
  done
  echo
  local option_number=$(($(input "option" ${#options[@]} $option_num) -1))
  if [ $option_number = 4 ]; then
    local confirm
    until [[ $confirm = "y" ]]; do
      echo "Delete branch '$branch'. Are you sure? [y/n]"
      read confirm
      if [[ $confirm = "n" ]]; then
        return
      fi
    done
  fi
  eval ${operations[$option_number]}
}

# ==============
# BRANCH MANAGER
# ==============

function branch(){
  if ! is_git_repo || is_git_dir; then
    echo "fatal: Not a git repository (or any of the parent directories): .git"
    return
  fi
  local branch=$(getbranch)
  local selection_num=$1
  echo
  echo [BRANCH MANAGER]
  echo
  echo "Options for current branch '$branch':"
  options=("Open web browser to github issue" "Open web browser to github request" "Compare files in file manager" "Checkout branch in all affected Leadfeeder Repos" "Copy branch name to clipboard" "Delete branch [WARNING]")
  operations=("issue" "request" "files" "checkoutall $branch" "copybranch" "deletebranch")
  echo
  for i in "${!options[@]}"; do
    printf "$(($i + 1)): ${options[$i]}\n"
  done
  echo
  local selection_number=$(($(input "option" ${#options[@]} $selection_num) -1))
  if [ $selection_number = 5 ]; then
    local confirm
    until [[ $confirm = "y" ]]; do
      echo "Delete branch '$branch'. Are you sure? [y/n]"
      read confirm
      if [[ $confirm = "n" ]]; then
        return
      fi
    done
  fi
  eval ${operations[$selection_number]}
}

# ======================
# OTHER BRANCH FUNCTIONS
# ======================

# Get the name of current branch
getbranch() {
    if ! is_git_repo || is_git_dir; then
      echo "fatal: Not a git repository (or any of the parent directories): .git"
      return
    fi
    local branch_name
    # Get the short symbolic ref
    branch_name=$(git symbolic-ref --quiet --short HEAD 2> /dev/null) ||
    # If HEAD isn't a symbolic ref, get the short SHA
    branch_name=$(git rev-parse --short HEAD 2> /dev/null) ||
    # Otherwise, just give up
    branch_name="(unknown)"
    printf $branch_name
}

# Copy name of branch to clipboard
alias copybranch="getbranch | pbcopy && echo Copied $(getbranch) to clipboard"

# Leave current branch and delete it
function deletebranch() {
  local branch
  branch=$(getbranch)
  eval "git checkout master"
  echo "Deleting branch $branch"
  eval "git branch -D $branch"
}

# When current issue covers multiple apps
# and you've named branches consistently across apps
# will only checkout repos into branch if it was previously created
# and repo currently has no uncommited changes
function checkoutall() { # requires an existing branch name as argument
  local wd=$(pwd)
  echo $wd
	eval "cd ${lf_dir}/liid.io"
	git checkout $@
	eval "cd ${lf_dir}/francium"
	git checkout $@
	eval "cd ${lf_dir}/plumbum"
	git checkout $@
	eval "cd ${lf_dir}/aurum"
	git checkout $@
	eval "cd ${lf_dir}/stannum"
	git checkout $@
	eval "cd ${lf_dir}/gacon"
	git checkout $@
	eval "cd ${lf_dir}/gems/liidio-resque-jobs"
	git checkout $@
	eval "cd ${lf_dir}/gems/liidio-utils"
	git checkout $@
	eval "cd ${lf_dir}/gems/liidio-db"
	git checkout $@
	eval "cd ${lf_dir}/leadfeeder-docker-dev"
	git checkout $@
  echo
	echo "Checked out all available repos to branch: $@"
  echo
	cd $wd
}
