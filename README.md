# dotfiles

This repo contains my dotfiles for configuration of my local development environment. I've started small with some of the crucial things that I'd rather not think about too much, such as my shell environment. I'm also including notes on installing some of the software/packages I use, particularly things that are configured by these dotfiles.

At some point, I'd like to improve the automation of my setup. Here are some ideas (some may belong elsewhere, but all configuration stuff is going here for now):

- [Automate software installation (and some config?) with Ansible](https://frontendmasters.com/courses/developer-productivity/the-problem-statement/)
- Use [Antigen](https://antigen.sharats.me/) for Oh My Zsh configuration
- Pay attention to new dotfiles showing up in my home directory and add them to this repo

## Homebrew

[Homebrew](https://brew.sh/) is needed to install `rcm` in macOS. 

``` shell
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

## rcm

I'm using [rcm](https://github.com/thoughtbot/rcm) to manage my dotfiles. I'm adding the basics of how I plan to use it here, but refer to [its documentation](https://thoughtbot.github.io/rcm/rcm.7.html) as needed. In general, with `rcm` I'll keep my dotfiles in `~/.dotfiles` (this repo), and use its tools for symlinking my home directory's config files to the `~/.dotfiles` directory.

macOS install:

``` shell
brew install rcm
```

Ubuntu install:

``` shell
sudo apt update
sudo apt install rcm
```

### Adding new dotfiles

Add new dotfiles to this repo using `mkrc`. Optionally, add tags using `-t`, or if the dotfile(s) being added are specific to a certain installation, put them in a separate directory using `-d`. Use the `-v` flag to get more verbose output.

For example, to add my work specific `.gitconfig` file, I may do something like this from my home directory.

``` shell
mkrc -v -t git -d .dotfiles/crx-dotfiles .gitconfig
```

This would symlink `.gitconfig` to `~/.dotfiles/crx-dotfiles/tag-git/gitconfig`.

### Adding my dotfiles to a new computer

This should be as simple as cloning this repo to `~/.dotfiles` and then running `install.sh`. This uses my `.rcrc` configuration file to determine which tags (and directories to install). For my work laptop, I think I'll run it a second time with `-d ~/.dotfiles/crx-dotfiles` to overwrite the existing `.gitconfig`. ...I think. Test that out.

## Software and Packages to install

In the future, maybe handle some or all of this with [Ansible](https://www.ansible.com/). Until then, here are instructions and documentation links for installing the software/packages that my dotfiles configure.

### Zsh

This is the default macOS shell.

TODO: Add instructions for installing this in Linux.

### Oh My Zsh

Install Oh My Zsh.

``` shell
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

TODO: Oh My Zsh and all of the themes and plugins are probably best managed using [Antigen](https://antigen.sharats.me/), which was not on my radar when I initially set all of this up.

### Powerlevel10k Theme

Install the [Powerlevel10k theme](https://github.com/romkatv/powerlevel10k#getting-started) for Oh My Zsh.

First, [install the recommended font](https://github.com/romkatv/powerlevel10k#meslo-nerd-font-patched-for-powerlevel10k).

Then, install the theme.

``` shell
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

### zsh-notify Oh My Zsh Plugin

This is a useful utility to help notify me of terminal commands completing. I've got it configured to notify me of long running commands and failed commands. I've only used it on macOS. Checkout [the installation instructions](https://github.com/marzocchi/zsh-notify) to see how to configure and use this in a different OS.

Install the [terminal-notifier](https://github.com/julienXX/terminal-notifier) prerequisite (macOS specific).

``` shell
brew install terminal-notifier
```

Install zsh-notify.

``` shell
git clone https://github.com/marzocchi/zsh-notify.git ~/.oh-my-zsh/custom/plugins/notify
```

### zsh-nvm Oh My Zsh Plugin

[This plugin](https://github.com/lukechilds/zsh-nvm) sets up auto switching to the appropriate Node version when a `.nvmrc` file is present.

``` shell
git clone https://github.com/lukechilds/zsh-nvm ~/.oh-my-zsh/custom/plugins/zsh-nvm
```

### zsh-users Oh My Zsh Plugins

[zsh-users](https://github.com/zsh-users) host a number of popular custom plugins for Oh My Zsh as well as Antigen. I initially installed all of these plugins with `brew`, but it's likely a good idea to set them up with Antigen when I have some time to clean this up.

[zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions) adds suggestions as you type commands based on history and completions.

[zsh-history-substring-search](https://github.com/zsh-users/zsh-history-substring-search) is configured to find previously run commands that start with whatever you've entered by hitting the up (or down) arrow to cycle through them.

[zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting) adds syntax highlighting to zsh.

Install them with brew:

``` shell
brew install zsh-autosuggestions
brew install zsh-history-substring-search
brew install zsh-syntax-highlighting
```
