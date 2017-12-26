# SEARCH THE WEB FROM YOUR TERMINAL

# command: `$ google what is the weather in london?`
function google() {
    search=""
    echo "Googling: $@"
    for term in $@; do
        search="$search%20$term"
    done
    open -a "${browser}" "https://www.google.com/search?q=$search"
}

# command: `$ stack How do I version a route in Ember?`
function stack() {
  search=""
  echo "Searching StackOverflow for: $@"
  for term in $@; do
    search="$search%20$term"
  done
  open -a "${browser}" "https://stackoverflow.com/search?q=$search"
}

# command: `$ wiki barack obama`
function wiki() {
    search=""
    echo "Searching Wikipedia for: $@"
    for term in $@; do
        search="$search%20$term"
    done
    open -a "${browser}" "https://en.wikipedia.org/w/index.php?search=$search"
}
