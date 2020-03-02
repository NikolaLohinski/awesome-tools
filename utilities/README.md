# Utilities

## Content
- [Shell](#shell)
- [Browser](#browser)
- [Git](#git)
- [Node](#node)
- [Python](#python)
- [Other](#other)
- [i3](#i3)

## Shell
1. Bash [aliases](./.bash_aliases)

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

## Browser
1. Vimium for [Chrome](http://vimium.github.io/) or [Firefox](https://addons.mozilla.org/fr/firefox/addon/vimium-ff/) to browse the web with your keyboard ;

1. [JSON Viewer awesome](https://chrome.google.com/webstore/detail/json-viewer-awesome/iemadiahhbebdklepanmkjenfdebfpfe) for Chrome only to visualize and json files in a very nice way ;

## Git
1. My git [configuration](./.gitconfig) ;

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

## Node
1. [Node Version Manager](https://github.com/nvm-sh/nvm) : POSIX-compliant bash script to manage multiple active `node.js` & `npm` versions ;

## Python
1. [virtualenvwrapper](https://virtualenvwrapper.readthedocs.io/en/latest/) is a set of extensions to [virtualenv](https://virtualenv.pypa.io/en/latest/) tool. The extensions include wrappers for creating and deleting virtual environments and otherwise managing your development workflow ;

## Other
1. Simplest terminal-friendly programming cheat sheet ever invented: [cheat.sh](https://cheat.sh/)

   Used with curl as such :

   ```bash
   $ curl cheat.sh/<TOPIC>/<QUERY>
   ```

   Example:

   ```bash
   $ curl cheat.sh/go/python+use+environment+variable
   ```
1. [`balenaEtcher`](https://www.balena.io/etcher/) is a very simple tool to flash USB keys into bootable drives

1. To share files via P2P on a local network, one should use [ShareDrop](https://www.sharedrop.io/)

1. If using Jetbrains products such as Goland, or Idea, and upgrading them with Jetbrains Toolbox, the executables are not accessible directly in the path. To make a dynamic link to the latest downloaded Pycharm (for example) version, proceed as follows:
   ```bash
   $ su
   $ cat << EOF > /usr/local/bin/pycharm
   
   #!/bin/sh
   exec $(ls -t -d $HOME/.local/share/JetBrains/Toolbox/apps/PyCharm-P/ch-*/*/ | grep -v ".plugins" | head -n 1)bin/pycharm.sh
   EOF

   $ exit 
   ```

## `i3`
1. My i3 configurations:
  * For [Manjaro](./i3/manjaro) ;
  * For [Ubuntu](./i3/ubuntu) ;

