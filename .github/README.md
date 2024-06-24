# Sterling Hamilton's Dotfiles

## Installation

Nothing much to this at the moment.
Clone it down, and run the bash script.

Here's how I run it:

```shell
$ pwd
/home/grok/Code/dotfiles

$ chmod u+x install.rb

$ ./install.rb
     ~/Code/dotfiles/gitconfig -> ~/.gitconfig
     ~/Code/dotfiles/gitignore -> ~/.gitignore
          ~/Code/dotfiles/nvim -> ~/.config/nvim
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

lrwxrwxrwx 1 grok grok 34 Jun 20 09:50 ./.gitconfig -> /home/grok/Code/dotfiles/gitconfig
lrwxrwxrwx 1 grok grok 34 Jun 20 09:50 ./.gitignore -> /home/grok/Code/dotfiles/gitignore
lrwxrwxrwx 1 grok grok 30 Jun 20 09:50 ./.zshrc -> /home/grok/Code/dotfiles/zshrc
```

## Safegaurds

If you run this and things already exist, it will attempt to make sure you really wanted to nuke those pre-existing options:

```shell
Target /home/grok/.gitconfig exists. Do you want to remove it? [y/N]

Skipping /home/grok/.gitconfig
Target /home/grok/.gitignore exists. Do you want to remove it? [y/N]

Skipping /home/grok/.gitignore
Target /home/grok/.config/nvim exists. Do you want to remove it? [y/N]

Skipping /home/grok/.config/nvim
Target /home/grok/.zshrc exists. Do you want to remove it? [y/N]

Skipping /home/grok/.zshrc
No changes made.
```

and if you said `y` to all of them:

```shell
Target /home/grok/.gitconfig exists. Do you want to remove it? [y/N]
y
Target /home/grok/.gitignore exists. Do you want to remove it? [y/N]
y
Target /home/grok/.config/nvim exists. Do you want to remove it? [y/N]
y
Target /home/grok/.zshrc exists. Do you want to remove it? [y/N]
y
     ~/Code/dotfiles/gitconfig -> ~/.gitconfig
     ~/Code/dotfiles/gitignore -> ~/.gitignore
          ~/Code/dotfiles/nvim -> ~/.config/nvim
         ~/Code/dotfiles/zshrc -> ~/.zshrc
```
