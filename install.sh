#!/bin/sh

function install_nvim_pack() {
  echo "Installing nvim packer"
  git clone --depth 1 https://github.com/wbthomason/packer.nvim\
  ~/.local/share/nvim/site/pack/packer/start/packer.nvim
}

function link_dotfile_dir() {
  ln -s ~/.dotfiles/.config/$1 ~/.config/$1
}

function link_dirs() {
  echo "Linking files"
  ln -s ~/.dotfiles/.gitconfig ~/.gitconfig

  echo "Linking dirs"
  link_dotfile_dir "alacritty"
  link_dotfile_dir "nvim"
  link_dotfile_dir "i3"
  link_dotfile_dir "i3status"

  #needed for nvim session save
  mkdir .local/share/nvim/session
}

function create_dotfiles_dir() {
  path=$(pwd)
  cd ~
  if [[ -e .dotfiles ]]; then
    echo "~./dotfiles already exists, run -F to override"
    return
  fi
  mv $path .dotfiles
  link_dirs
}

while [[ "$1" =~ ^- && ! "$1" == "--" ]]; do case $1 in
  -F | --force )
    # TODO use force
    force=1
    echo "$force"
    exit
    ;;
  -H | --help )
    shift; 
    echo "-F to override current .dotfiles"
    ;;
esac; shift; done
if [[ "$1" == '--' ]]; then shift; fi

create_dotfiles_dir
