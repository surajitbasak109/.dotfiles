![](https://raw.githubusercontent.com/extrawurst/gitui/master/demo.gif)

GitUI provides you with the comfort of a git GUI but right in your terminal.

## Features

- Fast and intuitive keyboard only control
- Context based help (no need to memorize tons of hot-keys)
- Inspect, commit, and amend changes (incl. hooks: pre-commit,commit-msg,post-commit)
- Stage, unstage, revert and reset files, hunks and lines
- Stashing (save, pop, apply, drop, and inspect)
- Push/Fetch to/from remote
- Branch List (create, rename, delete, checkout, remotes)
- Browse commit log, diff committed changes
- Scalable terminal UI layout
- Async git API for fluid control
- Submodule support

## Motivations
I do most of my git work in a terminal but I frequently found myself using git GUIs for some use-cases like: index, commit, diff, stash, blame and log.

Unfortunately popular git GUIs all fail on giant repositories or become unresponsive and unusable.

GitUI provides you with the user experience and comfort of a git GUI but right in your terminal while being portable, fast, free and opensource.

## Installation

#### Arch Linux
pacman -S gitui
#### Fedora
sudo dnf install gitui
#### Gentoo
Available in dm9pZCAq overlay

sudo eselect repository enable dm9pZCAq
sudo emerge --sync dm9pZCAq
sudo emerge dev-vcs/gitui::dm9pZCAq
#### Homebrew (macOS)
brew install gitui
#### MacPorts (macOS)
port install gitui
#### Winget (Windows)
winget install gitui
#### Scoop (Windows)
scoop install gitui
Chocolatey (Windows)
choco install gitui
#### Nix (Nix/NixOS)
Nixpkg

nix-env -iA nixpkgs.gitui
NixOS

nix-env -iA nixos.gitui
Termux (Android)
pkg install gitui
