# Sterling Hamilton's Dotfiles

## Installation

Nothing much to this at the moment.
Clone it down, and run the bash script.

Here's how I run it:

```shell
$ pwd
/home/grok/Code/dotfiles

$ bash install.bash
     ~/Code/dotfiles/gitconfig -> ~/.gitconfig
         ~/Code/dotfiles/zshrc -> ~/.zshrc
```

## Testing

You can go to the home directory and check that the symlink exists.


```shell
# Find all symbolic links (excluding those pointing to
# directories) in the current directory (non-recursively)
# and list them with colorized output using the `ls` command.

$ cd ~
$ find . -maxdepth 1 -type l ! -xtype d -exec ls --color=auto -l {} +
lrwxrwxrwx 1 grok grok 34 Jun 20 09:09 ./.gitconfig -> /home/grok/Code/dotfiles/gitconfig
lrwxrwxrwx 1 grok grok 30 Jun 20 09:09 ./.zshrc -> /home/grok/Code/dotfiles/zshrc
```
