
# =======
# RUBOCOP
# =======

# run rubocop with rspec tests against files changed since last commit
# be sure that gems rubocop and rubocop-rspec are installed
function cop() {
  local mod
  mod=$(git status -s | cut -c4- | grep '.rb' | xargs)
  if [ -n "$mod" ] ; then
    echo "Running rubocop on the following files:"
    echo $mod
    echo
    git status -s | cut -c4- | grep '.rb' | xargs bundle exec rubocop  --rails --require rubocop-rspec
  else
    echo "No files to inspect. Your haven't modiefied any ruby files since latest commit."
  fi
}
