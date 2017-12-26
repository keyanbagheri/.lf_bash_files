# ======
# DOCKER
# ======

alias dcapp='open -a "Docker"'
alias dc='docker-compose'
# shortcut to leadfeeder docker dev
alias dock="cd ${lf_dir}/leadfeeder-docker-dev/envs/databases"
# stop docker containers while removing any orphans
alias dcdown="cd ${lf_dir}/leadfeeder-docker-dev/envs/databases && docker-compose down --remove-orphans && cd -"
# build docker dbs again in background
alias dcup="cd ${lf_dir}/leadfeeder-docker-dev/envs/databases && docker-compose -f docker-compose.yml up -d --build && cd -"
