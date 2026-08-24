# dotfiles

custom config files for some of the softwares that i use.

Hyprland+Noctalia dotfiles modified from [cachyos-hypr-noctalia](https://github.com/CachyOS/cachyos-hypr-noctalia) using as the base.

## Installation

install [GNU Stow](https://www.gnu.org/software/stow/) `yay -S stow`
clone this in homedir

```bash
cd ~/.dotfiles
stow .
```

> [!NOTE]
> Backup or remove the existing files before creating symbolic links
> Use `stow --adopt .` with caution. This command should only be used if you are certain that the files in this folder are dummy/not required and any existing files in the target directories are the real config files.

## Updating

to create symbolic links to new files after adding them here, run this:

```bash
cd ~/.dotfiles
stow .
```

## Bin List

- nvim
- doom emacs (mostly used for org and org-roam)
- tmux
- zsh
- starship prompt
- fastfetch
- alacritty
- kitty
- vscode settings, keybindings, snippets
