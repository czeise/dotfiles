#!/bin/sh

# Bootstrap dotfiles. Assumes https://github.com/czeise/laptop has already
# run, so Homebrew is available. Safe to re-run.

set -e

if ! command -v rcup >/dev/null 2>&1; then
  brew install rcm
fi

# TODO: move these into the laptop bootstrap repo.
if ! command -v terminal-notifier >/dev/null 2>&1; then
  brew install terminal-notifier
fi

ZSH_NOTIFY_DIR="$HOME/.oh-my-zsh/custom/plugins/notify"
if [ ! -d "$ZSH_NOTIFY_DIR" ]; then
  git clone https://github.com/marzocchi/zsh-notify.git "$ZSH_NOTIFY_DIR"
fi

env RCRC="$HOME/.dotfiles/rcrc" rcup -v
