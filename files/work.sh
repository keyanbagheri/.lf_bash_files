# FUNCTIONS FOR LOADING WORKSPACE AND CLOSING IT DOWN

function startwork() {
  echo
  echo "LAUNCHING WORKSPACE ..."
  echo
  echo "LAUNCHING SLACK ..."
  echo
  echo "LAUNCHING DOCKER (please wait a minute) ..."
  echo
  open -a "Docker"
  open -a "Slack"
  # check to see that docker loading process has begun
  until [[ $(ps aux | grep Docker | grep -v grep | awk {'print $3*100'} | sed -n 2p) -gt 0 ]]
  do
    sleep 1
  done
  # check to see that docker loading process has completed
  until [[ $(ps aux | grep Docker | grep -v grep | awk {'print $3*100'} | sed -n 2p) -eq 0 ]]
  do
    sleep 2
  done
  echo "LAUNCHING DOCKER CONTAINERS ..."
  echo
  dock
  docker-compose -f docker-compose.yml up -d --build
  #
  # add any tmux or server commands here if you wish
  #
  echo "SWITCHING TO CODE DIRECTORY ..."
  echo
  echo "READY FOR WORK"
  echo
  code
}

function stopwork() {
  dock
  echo
  echo "SHUTTING DOWN WORKSPACE ..."
  echo
  echo "SHUTTING DOWN TMUXINATOR..."
  tmux kill-server
  echo
  echo "SHUTTING DOWN DOCKER CONTAINERS ..."
  docker-compose down --remove-orphans
  sleep 6
  echo
  echo "SHUTTING DOWN DOCKER ..."
  osascript -e 'quit app "Docker"'
  echo
  echo "SHUTTING DOWN SLACK ..."
  osascript -e 'quit app "Slack"'
  echo
  echo "SHUTTING DOWN ${editor} ..."
  killall "$editor"
  echo "SHUTTING DOWN TERMINAL ..."
  sleep 1
  echo
  echo "GOODBYE ..."
  sleep 2
  killall Terminal
}
