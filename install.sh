#!/usr/bin/env zsh

zparseopts u=uninstall

typeset -A packages
packages=(
  nvim $HOME/.config/nvim/lua
  tmux $HOME
  zsh $HOME
)

if [[ "$uninstall" = "-u" ]]; then
  for package target in "${(@kv)packages}"; do
    stow -v -t "$target" -D "$package"
  done
else
  for package target  in "${(@kv)packages}"; do
    stow -v -t "$target" "$package"
  done
fi


