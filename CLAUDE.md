# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository purpose

Personal dotfiles managed with [rcm](https://thoughtbot.github.io/rcm/rcm.7.html). Files in `tag-*/` directories are symlinked into `$HOME` by `rcup`, with the tag stripped from the filename (e.g. `tag-zsh/zshrc` → `~/.zshrc`).

## Layout

- `tag-<name>/` — files installed when tag `<name>` is active. Active tags are set in `rcrc` (`TAGS="zsh git ruby"`).
- `rcrc` — rcm config. Also defines `DOTFILES_DIRS`, which lets `$HOME/.dotfiles-local` override files in this repo. Personal/machine-specific overrides go there, not here.
- `install.sh` — one-shot installer; normal updates use `rcup` directly.

## Common commands

```sh
# Dry-run to preview what rcup would link
env RCRC=$HOME/.dotfiles/rcrc lsrc

# Apply changes (after editing files in this repo, or adding new ones)
rcup

# Add an existing dotfile from $HOME into this repo under a tag
mkrc -v -t <tag> ~/.<file>
```

After editing a file under `tag-*/`, no copy step is needed — the symlink in `$HOME` already points here. For zsh changes, `source ~/.zshrc` (or open a new shell) to pick them up.

## Notes

- `tag-zsh/zshrc` is the main shell config; it bootstraps Oh My Zsh, Powerlevel10k (currently being migrated to Starship on the `move-to-starship` branch), asdf, and various zsh-users plugins. External tooling (Oh My Zsh, plugins, fonts, asdf) is installed out-of-band — see README.md for the install steps.
- Don't put machine-specific secrets or overrides in tracked files; use `~/.dotfiles-local` (already on the `DOTFILES_DIRS` path and given precedence by rcm).
