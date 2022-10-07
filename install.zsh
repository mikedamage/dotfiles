#!/usr/bin/env zsh

zparseopts -D -E u=uninstall p+:=pkg_arg

typeset -A packages
packages=(
  nvim $HOME/.config/nvim/lua
  tmux $HOME
  zsh $HOME
)

function install_packages {
  local list
  local stow_flags=()

  if [ "${#pkg_arg[@]}" -eq 0 ]; then
    list=(${(k)packages[@]})
  else
    list=("${(@)pkg_arg:#-p}")
  fi

  if [[ "$uninstall" == "-u" ]]; then
    stow_flags=("-D")
  fi

  for package in "${list[@]}"; do
    local target="${packages[$package]}"
    stow ${(@)stow_flags} -v -t "$target" "$package"
  done
}

install_packages
