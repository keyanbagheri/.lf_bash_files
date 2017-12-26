# ==============================
# APPLICATION AND PATHNAME ALIAS
# ==============================

# Open Text Editor
alias edit='open -a "${editor}"'
# usage: `$ edit <filename or directory>`

# Open Slack
alias slack='open -a "Slack"'

# Open Browser
function web() {
  local site
	if [ $# -eq 0 ] ; then
    eval 'open -a "${browser}"'
	else
    eval 'open -a "${browser}" "https://$@"'
	fi
}
# usage: `$ web "<webpage>"`

# Now the following shortcut will get you directly to your leadfeeder /Code folder
alias code="cd ${lf_dir}"
