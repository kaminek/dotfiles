# dotfiles

My Personal Dotfiles

## Install

Dotfiles are managed by `stow`, to install the symlinks clone this repo and do:

```bash
stow -t $HOME */
```

to remove the symlinks use:

```bash
stow -t $HOME -D */
```

## Dependencies

- zsh
- ripgrep
- fzf
- jump
- direnv
