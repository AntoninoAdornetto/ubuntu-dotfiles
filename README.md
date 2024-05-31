# Dotfiles Collection 

This repository contains my personal configuration files for various applications and tools I use with Arch...btw.

# Features

### Alacritty

A GPU-accelerated terminal emulator. Please see [Alacritty Cargo Installation](https://github.com/alacritty/alacritty/blob/master/INSTALL.md) before using Alacritty as it won't work without cargo

### Hyprland & Wayland

Dynamic tiling

### Neovim

Lean mean keyboarding smashing machine [VIM Disel](https://github.com/AntoninoAdornetto/vim-diesel-kickstart)

### Zsh

Extended version of the Bourne Shell (sh), with many improvements and features

### Tmux

Terminal multiplexer for Unix-like operating systems.

# Setup Guide

I used to manage my dotfiles using a bare repo; a repo without it's own working tree. This worked well for a while but I found a much better system for managing dotfiles using [GNU Stow](https://www.gnu.org/software/stow/), a symlink farm manager that allows me to manage dotfiles in a simple and systematic way. 
