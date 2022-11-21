function install_nvim_pack()
{
  echo "Installing nvim packer"
  git clone --depth 1 https://github.com/wbthomason/packer.nvim\
  ~/.local/share/nvim/site/pack/packer/start/packer.nvim
}

function link_dirs() {
  echo "Linking dirs"
  ln -s ~/.dotfiles/.gitconfig ~/.gitconfig
  ln -s ~/.dotfiles/.config/alacritty/ ~/.config/alacritty 
  ln -s ~/.dotfiles/.config/nvim ~/.config

  #needed for session save
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
