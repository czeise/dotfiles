# dotfiles

This repo contains my dotfiles for configuration of my local development environment. I've started small with some of the crucial things that I'd rather not think about too much.

## rcm

I'm using [rcm](https://github.com/thoughtbot/rcm) to manage my dotfiles. I'm adding the basics of how I plan to use it here, but refer to [its documentation](https://thoughtbot.github.io/rcm/rcm.7.html) as needed. In general, with `rcm` I'll keep my dotfiles in `~/.dotfiles` (this repo), and use its tools for symlinking my home directory's config files to the `~/.dotfiles` directory.

## Install

Clone onto your laptop:

    git clone git@github.com:thoughtbot/dotfiles.git ~/.dotfiles

(Forked. [How to keep your fork
updated](http://robots.thoughtbot.com/keeping-a-github-fork-updated)).

Install [rcm](https://github.com/thoughtbot/rcm):

    brew install rcm

Do a dry run using `lsrc` before installing dotfiles:

    env RCRC=$HOME/.dotfiles/rcrc lsrc

Install the dotfiles:

    env RCRC=$HOME/dotfiles/rcrc rcup

After the initial installation, you can run `rcup` without the one-time variable
`RCRC` being set (`rcup` will symlink the repo's `rcrc` to `~/.rcrc` for future
runs of `rcup`). [See
example](https://github.com/thoughtbot/dotfiles/blob/master/rcrc).

This command will create symlinks for config files in your home directory.
Setting the `RCRC` environment variable tells `rcup` to use standard
configuration options:

- Exclude the `README.md`, `README-ES.md` and `LICENSE` files, which are part of
  the `dotfiles` repository but do not need to be symlinked in.
- Give precedence to personal overrides which by default are placed in
  `~/dotfiles-local`
- Please configure the `rcrc` file if you'd like to make personal
  overrides in a different directory

### Adding new dotfiles

Add new dotfiles to this repo using `mkrc`. Optionally, add tags using `-t`, or if the dotfile(s) being added are specific to a certain installation, put them in a separate directory using `-d`. Use the `-v` flag to get more verbose output.

For example, to add my work specific `.gitconfig` file, I may do something like this from my home directory.

``` shell
mkrc -v -t git -d .dotfiles/crx-dotfiles .gitconfig
```

This would symlink `.gitconfig` to `~/.dotfiles/crx-dotfiles/tag-git/gitconfig`.

~~This should be as simple as cloning this repo to `~/.dotfiles` and then running `install.sh`. This uses my `.rcrc` configuration file to determine which tags (and directories to install). For my work laptop, I think I'll run it a second time with `-d ~/.dotfiles/crx-dotfiles` to overwrite the existing `.gitconfig`. ...I think. Test that out.~~

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

### asdf

Follow the instructions in their [Getting Started documentation](https://asdf-vm.com/guide/getting-started.html).
