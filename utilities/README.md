/home/agent-k# Utilities

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

1. [bash-git-prompt](https://github.com/magicmonty/bash-git-prompt) : An informative and fancy bash prompt for `git` users ;

1. To dump multiline inputs into a file directly from a terminal, one needs to use `<<` operator as such:
   ```
   $ cat << EOF > filename.yml
   ...
   content:
     of: "file"
   ...
   EOF
   ```
1. As an alternative to `find`, [`fd`](https://github.com/sharkdp/fd) is written in Rust and drastically more efficient ;

1. [`entr`](https://github.com/eradman/entr) is a nice independent utility for running arbitrary commands when files change ;


## Browser
1. Vimium for [Chrome](http://vimium.github.io/) or [Firefox](https://addons.mozilla.org/fr/firefox/addon/vimium-ff/) to browse the web with your keyboard ;

1. [JSON Viewer awesome](https://chrome.google.com/webstore/detail/json-viewer-awesome/iemadiahhbebdklepanmkjenfdebfpfe) for Chrome only to visualize and json files in a very nice way ;

## Git
1. My git [configuration](./.gitconfig) ;

1. A command line tool to interact with a Gitlab repository, making it simple to clone, fork, including seamless workflow for creating merge requests, issues and snippets: [lab](https://github.com/zaquestion/lab) ;

1. A nice plugin to bash providing contextual git information : [bash-git-prompt](https://github.com/magicmonty/bash-git-prompt) ;

1. Git [autocompletion](https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash) for bash ;

## Node
1. [Node Version Manager](https://github.com/nvm-sh/nvm) : POSIX-compliant bash script to manage multiple active `node.js` & `npm` versions ;

## Python
1. [virtualenvwrapper](https://virtualenvwrapper.readthedocs.io/en/latest/) is a set of extensions to [virtualenv](https://virtualenv.pypa.io/en/latest/) tool. The extensions include wrappers for creating and deleting virtual environments and otherwise managing your development workflow ;

## Other
1. Simplest terminal-friendly programming cheat sheet ever invented: [cheat.sh](https://cheat.sh/)

   Used with curl as such :

   ```
   $ curl cheat.sh/<TOPIC>/<QUERY>
   ```

   Example:

   ```
   $ curl cheat.sh/go/python+use+environment+variable
   ```
1. [`balenaEtcher`](https://www.balena.io/etcher/) is a very simple tool to flash USB keys into bootable drives

## i3
1. My i3 [configuration](./.i3/config) ;

