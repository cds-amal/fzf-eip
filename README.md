# EIP Fuzzy finder launch thing

[fzf](https://github.com/junegunn/fzf) helper to search EIPs by number or name.
Selecting it will open the EIP in your browser. [See this
demo](https://www.youtube.com/watch?v=2VOZV9tsmGs)

# Installation

1. Install [fzf](https://github.com/junegunn/fzf), a general-purpose
   command-line fuzzy finder. 

1. Clone this repo
   ```sh
   git clone git@github.com:cds-amal/fzf-eip ~/.fzf-eip
   ```
2. Edit your shell startup script file

   ```sh
   # somewhere in your .(zsh/bash)rc file...

   # FZF_EIP_HOME is the directory where you cloned to
   export FZF_EIP_HOME=$HOME/.fzf-eip
   source $FZF_EIP_HOME/init.sh
   ```
## A note on Browser configuration

For non WSL linux and Mac OS X, this script relies on `xdg-open`. You can configure this to a different browser if `xdg-open` is not an alternative for you.

For WSL2, it relies on the fullpath to the browser executable. You can change the default to use the browser of your choice. ./init.sh for more details.

