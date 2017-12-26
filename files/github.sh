# ============================
# GITHUB WEB BROWSER SHORTCUTS
# ============================

# (THESE FOUR CAN BE CALLED ANYWHERE IN TERMINAL)

# OPEN GITHUB PROFILE PAGE
alias github='open -a "${browser}" https://github.com/${github_handle}'

# OPEN GITHUB ISSUES ASSIGNED TO YOU
alias issues='open -a "${browser}" https://github.com/issues/assigned'

# OPEN YOUR ACTIVE GITHUB PULL REQUESTS
alias requests='open -a "${browser}" https://github.com/pulls'

# DISPLAY ALL YOUR GITHUB REPOS
alias repos='open -a "${browser}" https://github.com/${github_handle}?tab=repositories'


#(THE REST CAN ONLY BE CALLED FROM INSIDE OF GIT REPO)

# DISPLAY CURRENT REPO IN GITHUB
function repo() {
	local repo
	repo=$(PWD)
	eval 'open -a "${browser}" https://github.com/${github_handle}/${repo##*/}'
}

# GET CURRENT ISSUE IN GITHUB
# this function works if you have issue number in your branch name
# function will search for isolated 4 digit issue number
# (excluding all longer or shorter numbers)
# function will then grab issue number
function getissue() {
    local issue_num
    issue_num=$(getbranch | sed -E 's/[0-9]{5,}//g' | grep -o -E '[0-9]{4}')
    printf $issue_num
}


# DISPLAY CURRENT ISSUE IN GITHUB (add issue number as argument if you want to search by issue number)
function issue() {
	local issue
	if [ $# -eq 0 ] ; then
		issue=$(getissue)
	else
		issue=$@
	fi
	eval 'open -a "${browser}" "https://github.com/Leadfeeder/issue-tracker/issues/$issue"'
}

# DISPLAY CURRENT PULL REQUEST IN GITHUB (add issue number as argument if you want to search by issue number)
function request() {
	local request
	if [ $# -eq 0 ] ; then
		request=$(getissue)
	else
		request=$@
	fi
	eval 'open -a "${browser}" "https://github.com/pulls?utf8=%E2%9C%93&q=Leadfeeder%2Fissue-tracker%23$request"'
}
