# Sterling Hamilton's Dotfiles

## Installation

Nothing much to this at the moment.
Clone it down, and run the bash script.

I've got one file hooked up to this currently.

In my current environment that looks like:

```shell
$ pwd
/home/grok/Code/dotfiles

bash ./install.bash
                              ~/Code/dotfiles/gitconfig -> ~/.gitconfig
```

## Testing

You can go to the home directory and check that the symlink exists.

```shell
$ cd ~
$ find . -maxdepth 1 -type l ! -xtype d -exec ls -l {} +
lrwxrwxrwx 1 grok grok 34 Jun 20 00:04 ./.gitconfig -> /home/grok/Code/dotfiles/gitconfig
```
