# dotfiles

My personal dotfiles, managed with [rcm](https://github.com/thoughtbot/rcm). Files live under `tag-*/` directories and `rcup` symlinks them into `$HOME` (e.g. `tag-zsh/zshrc` → `~/.zshrc`). Active tags are set in `rcrc`.

## Install

These dotfiles assume software (Homebrew, git, zsh, asdf, Starship, etc.) is already installed by my [czeise/laptop](https://github.com/czeise/laptop) bootstrap. Run that first on a new machine.

Then:

``` shell
git clone git@github.com:czeise/dotfiles.git ~/.dotfiles
~/.dotfiles/install.sh
```

`install.sh` installs `rcm` if it's missing and runs `rcup` with this repo's `rcrc`. After the first run, `~/.rcrc` is symlinked into place, so future updates are just:

``` shell
rcup
```

To preview what would change without touching anything:

``` shell
env RCRC=$HOME/.dotfiles/rcrc lsrc
```

### Machine-specific overrides

`rcrc` sets `DOTFILES_DIRS="$HOME/.dotfiles-local $HOME/.dotfiles"`, so anything in `~/.dotfiles-local` (work laptop configs, secrets, machine-specific tweaks) takes precedence over this repo. Don't commit those here.

### Adding new dotfiles

Use `mkrc` to pull an existing file from `$HOME` into this repo under a tag:

``` shell
mkrc -v -t git ~/.gitconfig
```

## External tools

These are installed by the laptop repo or manually — they're not managed by `rcm`, but the configs in this repo expect them to exist.

- **Oh My Zsh** — `sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`
- **Starship** prompt — `brew install starship`
- **asdf** — see [Getting Started](https://asdf-vm.com/guide/getting-started.html)
- **zsh-users plugins** — `brew install zsh-autosuggestions zsh-history-substring-search zsh-syntax-highlighting`
- **terminal-notifier** + **zsh-notify** (macOS) — currently installed by `install.sh`. **TODO:** move these into the [czeise/laptop](https://github.com/czeise/laptop) bootstrap so this repo only handles dotfile symlinks.
