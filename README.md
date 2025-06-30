# dotfiles

managing my fka$$ configs in a remote repo to avoid redoing ts.

## Installation

install [GNU Stow](https://www.gnu.org/software/stow/) `yay -S stow`
clone this in homedir

```bash
cd ~/dotfiles
stow .
```

> NOTE: Backup or remove the existing files before creating symbolic links
> Use `stow --adopt .` with caution. This command should only be used if you are certain that the files in this repository are dummy/not required and any existing files in the target directories are the real config files.

## Updating

to create symbolic links to new files after adding them here, run this:

```bash
cd ~/dotfiles
stow .
```

## alist

- nvim
- doom emacs (mostly used for org and org-roam)
- tmux
- zsh
- starship prompt
- fastfetch
- alacritty
- kitty
- vscode settings, keybindings, snippets

## TODO

- setup scripts to install required packages and setup all
- gnome configs in a script if possible, or switch to hyprland or sumn
