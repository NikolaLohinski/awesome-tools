<p align="center">
  <br>
  <img width="400" src="assets/img/logo.svg" alt="logo of tools-awesome repository">
  <br>
  <br>
</p>

> This repository holds everything I thought interesting keeping record of 🤷

# Awesome tools [![Awesome](https://cdn.rawgit.com/sindresorhus/awesome/d7305f38d29fed78fa85652e3a63e154dd8e8829/media/badge.svg)](https://github.com/sindresorhus/awesome)

- [Containers](#containers)
  - [Docker](#docker)
  - [Kubernetes](#kubernetes)
- [Languages & frameworks](#languages-and-frameworks)
  - [Shell](#shell)
  - [Golang](#golang)
  - [Javascript](#javascript)
    - [Node](#node)
    - [Vue.js](#vuejs)
  - [Python](#python)
  - [Git](#git)
- [Documentation](#documentation)
  - [Swagger](#swagger)
  - [Code resources](#code-resources)
- [Other](#other)
  - [Browser](#browser)
  - [Desktop](#desktop)
  - [Software](#software)
  

## Containers
### Docker
1. **Use Cloud SQL with the google proxy side container**:
    In order to proxify a cloudSQL POSTGRES instance in a sideContainer, you will need a service account with one of this roles :
    * Cloud SQL > Cloud SQL Client
    * Cloud SQL > Cloud SQL Editor
    * Cloud SQL > Cloud SQL Admin
    
    Once this service account is created, you will need a service-account key to be available locally. To generate one, 
    go to the IAM page of this service account (GCP console > IAM & admin > Service accounts), generate one and download it.
    
    Retrieve the Instance Connection Name field: 
    * Go to GCP console > SQL
    * Select the instance you want to access to
    * In the `Overview` tab, the `Instance Connection Name` field is under the `Connect to this instance` section.
    
    Open a terminal and define the following variables:
    * DIR_PATH_CREDENTIALS: local path to the directory containing the credentials you just generated and downloaded
    * INSTANCE_NAME: the instance connection name you just found in the GCP console
    * CREDENTIALS: name of the credentials file
    For example:
    ``` 
    $ export DIR_PATH_CREDENTIALS=/home/you/Downloads
    $ export INSTANCE_NAME=my-awesome-project:europe-west1:database-instance-id
    $ export CREDENTIALS=service-account-credentials.json
    ```
    Start the cloud SQL proxy container:
    ```
    $ docker run -p 127.0.0.1:5432:5432 --name cloud-sql-proxy -v ${DIR_PATH_CREDENTIALS}:/opt b.gcr.io/cloudsql-docker/gce-proxy /cloud_sql_proxy -instances=${INSTANCE_NAME}=tcp:0.0.0.0:5432 -credential_file=/opt/${CREDENTIALS}
    ```

### Kubernetes
1. **Telepresence**:
    Just follow the script given on https://www.telepresence.io/reference/install
    ```
    curl -s https://packagecloud.io/install/repositories/datawireio/telepresence/script.deb.sh | sudo bash sudo apt install --no-install-recommends telepresence
    ```
    Telepresence is using the kubectl commands so you just have to connect to your cluster using the command line given in the google cloud platform console.
    Since we enabled the k8s network policies, we need to deploy the telepresence node we will later connect to by applying the following file: telepresence.yaml
    ```
    kubectl apply -f /tmp/telepresence.yaml
    ```
    
    Then you just have to type Telepresence in your console: all the cluster IPs are proxyfied automatically.
    ```
    telepresence --deployment telepresence --run-shell --also-proxy SOME.IP.TO.PROXYFY
    ```
    
    The swap deployment is useful as it replace the current deployment by your local environment. So you are able to debug the code being edited in goland. In order to do the replacement, telepresence sets the replicaset to 0 in your cluster.
    The following command is used to replace the format-worker deployment:
    ```
    telepresence --also-proxy 192.168.1.249 --also-proxy 192.168.1.250 --swap-deployment format-worker
    ```
    In the case of an non-worker pod, you must add --expose 8080 to bind the port in the cluster

1. Switch faster between clusters and namespaces in kubectl with [kubectx](https://kubectx.dev).

1. [K9s](https://github.com/derailed/k9s) provides a curses based terminal UI to interact with your Kubernetes clusters. The aim of this project is to make it easier to navigate, observe and manage your applications in the wild. K9s continually watches Kubernetes for changes and offers subsequent commands to interact with observed Kubernetes resources.

1. [`kind`](https://github.com/kubernetes-sigs/kind) is a very useful tool for running local Kubernetes clusters using Docker container "nodes".

## Languages and frameworks

### Shell
1. Bash [aliases](assets/bash/.bash_aliases)

1. [fzf](https://github.com/junegunn/fzf) : an interactive Unix filter fuzzy finder for command-line that can be used with any list; files, command history, processes, hostnames, etc... ;

1. To dump multiline inputs into a file directly from a terminal, one needs to use `<<` operator as such:
   ```bash
   $ cat << EOF > filename.yml
   ...
   content:
     of: "file"
   ...
   EOF
   ```
1. As an alternative to `find`, [`fd`](https://github.com/sharkdp/fd) is written in Rust and drastically more efficient ;

1. [`entr`](https://github.com/eradman/entr) is a nice independent utility for running arbitrary commands when files change ;

1. To have eternal history in bash, add the following to your `~/.bashrc`:
   ```bash
   # Eternal bash history.
   # ---------------------
   # Undocumented feature which sets the size to "unlimited".
   # http://stackoverflow.com/questions/9457233/unlimited-bash-history
   export HISTFILESIZE=
   export HISTSIZE=
   export HISTTIMEFORMAT="[%F %T] "
   # Change the file location because certain bash sessions truncate .bash_history file upon close.
   # http://superuser.com/questions/575479/bash-history-truncated-to-500-lines-on-each-login
   export HISTFILE=~/.bash_eternal_history
   # Force prompt to write history after every command.
   # http://superuser.com/questions/20900/bash-history-loss
   PROMPT_COMMAND="history -a; $PROMPT_COMMAND"
   ```
   Moreover, you need to make sure that no other file such as `~/.profile` or `~/.bash_profile` sets `HISTFILESIZE` or `HISTSIZE` environment variables.

1. [`direnv`](https://direnv.net/) is a shell extension. It adds a new feature that can load and unload environment variables depending on the current directory.

### Golang
1. Output a test coverage report easily :
   ```
   $ go test -coverprofile=/tmp/coverage.out
   $ go tool cover -html=/tmp/coverage.out -o /tmp/coverage.html
   $ <YOUR FAVORITE BROWSER> /tmp/coverage.html &
   ```
1. Upgrade or downgrade easily Golang with minimal system intrusions using [update-golang.sh](https://github.com/udhos/update-golang) ;

1. Manage different versions of Golang with [`gvm`](https://github.com/moovweb/gvm) ;

### Javascript 
#### Node
1. [Node Version Manager](https://github.com/nvm-sh/nvm) : POSIX-compliant bash script to manage multiple active `node.js` & `npm` versions ;

#### Vue.js
1. Beautiful UI components framework: [`cube-ui`](https://github.com/didi/cube-ui)

### Python
1. [virtualenvwrapper](https://virtualenvwrapper.readthedocs.io/en/latest/) is a set of extensions to [virtualenv](https://virtualenv.pypa.io/en/latest/) tool. The extensions include wrappers for creating and deleting virtual environments and otherwise managing your development workflow ;

### Git
1. My git [configuration](assets/git/.gitconfig) ;

1. To have a global `.gitignore` file accross the environment, create a `.gitignore` in your home directory, and run: 
   ```
   $ git config --global core.excludesfile ~/.gitignore
   ```
   This will create the following entry in your `.gitconfig`:
   ```
   [core]
         excludesfile = {path-to-home}/.gitignore
   ```

1. A command line tool to interact with a Gitlab repository, making it simple to clone, fork, including seamless workflow for creating merge requests, issues and snippets: [lab](https://github.com/zaquestion/lab) ;

1. A command line tool to interact with a Github repository: [`hub`](https://hub.github.com/) 

1. A nice plugin to bash providing contextual git information : [bash-git-prompt](https://github.com/magicmonty/bash-git-prompt) ;

1. Git [autocompletion](https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash) for bash ;

## Documentation
### Swagger
1. Node [swagger-ui-watcher](https://github.com/moon0326/swagger-ui-watcher) with hot reload feature to serve a rendered swagger HTML ;

1. Convert OpenAPI definitions into `json` schemas for all types in the API with [openapi2jsonschema](https://github.com/instrumenta/openapi2jsonschema) ;

1. Render very nice customizable swaggers in `HTML` with [redoc](https://github.com/Redocly/redoc) ;

### Code resources
1. [Antora](https://antora.org/) is a multi-repository documentation site generator for tech writers who love writing in AsciiDoc ;

1. Create and share beautiful images of your source code with [carbon](https://carbon.now.sh) ;

## Other
### Browser
1. Vimium for [Chrome](http://vimium.github.io/) or [Firefox](https://addons.mozilla.org/fr/firefox/addon/vimium-ff/) to browse the web with your keyboard ;

1. [JSON Viewer awesome](https://chrome.google.com/webstore/detail/json-viewer-awesome/iemadiahhbebdklepanmkjenfdebfpfe) for Chrome only to visualize and json files in a very nice way ;

### Desktop
1. My i3 configurations:
   * For [Manjaro](assets/i3/manjaro) ;
   * For [Ubuntu](assets/i3/ubuntu) ;

1. If using Jetbrains products such as Goland, or Idea, and upgrading them with Jetbrains Toolbox, the executables are not accessible directly in the path. To make a dynamic link to the latest downloaded Pycharm (for example) version, proceed as follows:
   ```bash
   $ su
   $ cat << EOF > /usr/local/bin/pycharm
   
   #!/bin/sh
   exec $(ls -t -d $HOME/.local/share/JetBrains/Toolbox/apps/PyCharm-P/ch-*/*/ | grep -v ".plugins" | head -n 1)bin/pycharm.sh
   EOF

   $ exit 
   ```
  
### Software
1. [Bitwarden](https://bitwarden.com/) is an opensource authentication management solution to help handle passwords, keys, sensitive data etc...
   It comes handy with a nice [CLI](https://github.com/bitwarden/cli) for terminal interaction with the vault.

1. [`balenaEtcher`](https://www.balena.io/etcher/) is a very simple tool to flash USB keys into bootable drives

1. To share files via P2P on a local network, one should use [ShareDrop](https://www.sharedrop.io/)

1. Simplest terminal-friendly programming cheat sheet ever invented: [cheat.sh](https://cheat.sh/)

   Used with curl as such :

   ```bash
   $ curl cheat.sh/<TOPIC>/<QUERY>
   ```

   Example:

   ```bash
   $ curl cheat.sh/go/python+use+environment+variable
   ```
