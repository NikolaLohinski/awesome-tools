# General
alias ll="ls -alh"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

alias e="nano"

# Python
alias pp="python -mjson.tool"
alias serve="python -m SimpleHTTPServer 8888"

# Go
gopath() {
  export GOPATH=$(readlink -f $1)
}
goroot() {
  export GOROOT=$(readlink -f $1)
}

# Docker
alias dk-rm="docker rm -vf $(docker ps -a -q)"

# Docker-compose
alias dkcmp="docker-compose"
complete -F _docker_compose dkcmp

# Kubernetes
alias k="kubectl"
source <(kubectl completion bash | sed 's/kubectl/k/g')
alias kctx="kubectx"

# Gcloud
alias g="gcloud"
