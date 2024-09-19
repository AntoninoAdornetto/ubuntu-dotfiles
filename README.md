# DIPPIN DOTS

This repository contains my personal configuration files for various applications and tools I use with Arch...btw.

# Setup Guide

Previously, I was managing my dotfiles using a bare repo (repo without it's own working tree). This worked well for a while but I found a much better system for managing dotfiles using [GNU Stow](https://www.gnu.org/software/stow/), a symlink farm manager that allows me to manage dotfiles in a simple and systematic way. 

Ensure stow is installed and then run the following:

```sh
git clone --recurse-submodules git@github.com:AntoninoAdornetto/dotfiles.git ~/.dotfiles
```
