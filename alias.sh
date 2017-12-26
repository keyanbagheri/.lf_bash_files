# APP AND DIRECTORY ALIAS

# ==============================
# APPLICATION AND PATHNAME ALIAS
# ==============================

# Open Text Editor
alias edit='open -a "${editor}"'
# usage: `$ edit <filename or directory>`

# Open Browser
alias web='open -a "${browser}"'
# usage: `$ web "<webpage>"`

# Open Slack
alias slack='open -a "Slack"'

# Now the following shortcut will get you directly to your leadfeeder /Code folder
alias code="cd ${lf_dir}"


# =======
# RUBOCOP
# =======

# run rubocop with rspec tests against files changed since last commit
# be sure that gems rubocop and rubocop-rspec are installed
alias cop="git status -s | cut -c4- | grep '.rb' | xargs rbundle exec ubocop  --rails --require rubocop-rspec"


# =====
# RAILS
# =====

# migrate dev and test databases at the same time
alias migrate='bundle exec rake db:migrate; RAILS_ENV=test bundle exec rake db:migrate'
