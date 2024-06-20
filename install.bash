#!/usr/bin/env bash

# install all files to ~ by symlinking them,
# this way, updating them is as simple as git pull
#
# Author: Sterling Hamilton <sterling.hamilton@gmail.com>
# Date: 2024.06.19
# License: MIT
#
# Kudos to @bahamas10 for the obvious pilfering.

# Not all implementations of ln support the -v option.
# Different Unix-like operating systems may have different versions of
# the ln command with varying supported options.
symlink() {
  printf '%30s -> %s\n' "${1/#$HOME/\~}" "${2/#$HOME/\~}"
  ln -nsf "$@"
}

dotfiles=(
  gitconfig
  zshrc
)

# Removing any existing directories that match the name of the dotfile but are not symbolic links.
# Creating new symbolic links from the files in the current directory to the home directory.
for f in "${dotfiles[@]}"; do
  [[ -d ~/.$f && ! -L ~/.$f ]] && rm -r ~/."$f"
  symlink "$PWD/$f" ~/."$f"
done
