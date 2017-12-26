# GIT ALIAS AND SHORTCUT FUNCTIONS

# ==============================
# ADDING, COMMITTING AND PUSHING
# ==============================

# Shortcut to add all
alias add="git add -A"

# Shortened commit command (use after git add)
function commit() {  #requires a commit message as argument
  eval "git commit -m '$@'"
}

# ADD AND COMMIT IN ONE COMMAND
function admit() { #requires a commit message as argument
  eval "git add -A && git commit -m '$@'"
}

# ADD COMMIT AND PUSH TO YOUR ORIGIN/BRANCH IN ONE COMMAND
function push_branch() { #requires a commit message as argument
  eval "admit $@"
  git push
}

# ===========================
# NAVIGATING/EDITING BRANCHES
# ===========================

# Get latest leadfeeder code
alias fetch="git fetch leadfeeder"
alias pull="git pull leadfeeder master"

# Copy name of branch to clipboard
alias get_branch="get_git_branch | pbcopy"

# Leave current branch and delete it
function delete_branch() {
  local branch
  branch=$(get_git_branch)
  eval "git checkout master"
  eval "git branch -D $branch"
}

# When current issue covers multiple apps
# and you've named branches consistently across apps
# will only checkout repos into branch if it was previously created
# and repo currently has no uncommited changes
function checkout_all() { # requires an existing branch name as argument
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
	echo "Checked out all available repos to branch: $@"
	code
}

# ========================
# OPENING ALL EDITED FILES
# ========================

# Open any files modified or created since last commit in chosen text editor
function open_modified() {
  local mods
  mods=$(git status -s | cut -c4- | tr '\n' ' ')
  eval "edit $mods"
}

# Open any files different from master (before rebase) in chosen text editor
function open_changes() {
  local difs
  difs=$(git diff -b -w --name-only master $(get_git_branch) | tr '\n' ' ')
  eval "edit $difs"
}

# Open any conflicting files from current rebase in chosen text editor
function open_conflicts() {
  local conf
  conf=$(git diff --name-only --diff-filter=U | tr '\n' ' ')
  eval "edit $conf"
}
