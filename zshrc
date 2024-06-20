export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# Emulate pbcopy for linux.
# Example usage: `cat myfile.txt | pbcopy` or pbcopy << myfile.txt
alias pbcopy="xclip -selection clipboard"

# Ruby stuff.
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# Vivid is a generator for the LS_COLORS environment variable that controls the colorized output of ls, tree, fd, bfs, dust and many other tools.
export LS_COLORS="$(vivid generate snazzy)"

# Powerful CLI tool to take control of the Spotify client.
export PATH=$PATH:/home/grok/.spicetify

# Deno is a runtime for JavaScript and TypeScript that is built on the V8 JavaScript engine and Rust.
export DENO_INSTALL="/home/grok/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# NVM (Node Version Manager) is a tool that allows you to manage multiple versions of Node.js on a single machine.
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm.
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion.

# Neovim: It's an editor that you get married to, divorced from, lose half of your stuff, then get back together with, only to realize it's the most toxic but still best relationship you've ever had.
export EDITOR="nvim"

# A new implementation of NPM that uses hard linking as a way of managing files.
export PNPM_HOME="/home/grok/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# Emacs because I cheat on Neovim now and again.
# It's why we got divorced.
export PATH="$HOME/.emacs.d/bin:$PATH"
alias emacs="emacsclient -c -a 'emacs'"

# Navigation
alias ll="ls -laF ${colorflag}"
alias ..="cd .."
alias ~="cd ~" # `cd` is probably faster to type though
