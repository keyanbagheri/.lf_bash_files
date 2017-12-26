# GITHUB WEB BROWSER SHORTCUTS

# OPEN GITHUB PROFILE PAGE
alias github="web http://github.com/${github_handle}"

# OPEN GITHUB ISSUES ASSIGNED TO YOU
alias issues="web http://github.com/issues/assigned"

# OPEN YOUR ACTIVE GITHUB PULL REQUESTS
alias pulls="web http://github.com/pulls"

# DISPLAY ALL YOUR GITHUB REPOS
alias repos="web http://github.com/${github_handle}?tab=repositories"

# DISPLAY CURRENT REPO IN GITHUB
function repo() {
	local repo
	repo=$(PWD)
	eval "web http://github.com/${github_handle}/${repo##*/}"
}

# DISPLAY CURRENT ISSUE IN GITHUB
# this function works with branches using the following naming convention:
# branch name : 3404-updating-some-feature
# the number it starts with should be the 4 digit issue number
# function will then grab issue number and load corresponding github page
function issue() {
	local issue
	issue=$(get_git_branch)
	eval "web https://github.com/Leadfeeder/issue-tracker/issues/${issue:0:4}"
}
