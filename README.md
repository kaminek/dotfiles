# Dotfiles

My Personal Dotfiles

## Install

Load your SSH key into the agent and store its passphrase in the macOS Keychain
(needed for git/GitHub and the tmux tpm bootstrap; prompts once, then never again):

```bash
ssh-add --apple-use-keychain ~/.ssh/id_ed25519
ssh -T git@github.com   # verify auth
```

This relies on `~/.ssh/config` having `UseKeychain yes` + `AddKeysToAgent yes`
so the key auto-loads on every login. That config ships in the `ssh` package
(stowed to `$HOME`, see below).

Dotfiles are managed by `stow`, to install the symlinks clone this repo and do:

```bash
stow .
```

The `ssh` package targets `$HOME` (not `~/.config`, the `.stowrc` default), so
stow it separately:

```bash
stow --target="$HOME" ssh
```

After stowing, register the custom bat themes (per machine; delta/`git diff`
warns about unknown themes otherwise):

```bash
bat cache --build
```

to remove the symlinks use:

```bash
stow -D .
```
