# General
alias ll="ls -alh"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
# Add more watchers in case the limit is reached with tools such as webpack
alias morewatchers="echo fs.inotify.max_user_watches=524288 | sudo tee /etc/sysctl.d/40-max-user-watches.conf && sudo sysctl --system"
# Editor
alias e="nano"
# File navigator
alias l="ranger ."
alias f="ranger ."
# Fast command line copy to clipboard (use as such toclipboard '...command...')
toclipboard() {
  eval "$1" | xclip -selection c
}
frombase64(){
  echo $1 | base64 --decode | toclipboard
}
tobase64(){
  echo $1 | base64 | toclipboard
}

# Get now time formatted in RFC3339
alias now="date --rfc-3339=ns | sed 's/ /T/; s/\(\....\).*\([+-]\)/\1\2/g'"

# Python
alias pp="python2 -mjson.tool"
alias serve="python3 -m server.http"

# Go
gopath() {
  export GOPATH=$(readlink -f $1)
}
goroot() {
  export GOROOT=$(readlink -f $1)
}
covergo(){
  go test $1 -coverprofile=/tmp/coverage.out
  go tool cover -html=/tmp/coverage.out -o /tmp/coverage.html
  google-chrome-stable /tmp/coverage.html &
}

# Docker
alias dk-rm="docker rm -vf $(docker ps -a -q)"

# Docker-compose
alias dkcmp="docker-compose"
complete -F _docker_compose dkcmp

# Kubernetes
alias k="kubectl"
source <(kubectl completion bash | sed 's/kubectl/k/g')

# Gcloud
alias g="gcloud"

# Cheat sheet
function cheat() {
  curl cht.sh/$1
}
