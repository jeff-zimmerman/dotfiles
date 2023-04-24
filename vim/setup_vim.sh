#!/usr/bin/env bash

# get the directory of the script
# https://stackoverflow.com/questions/59895/getting-the-source-directory-of-a-bash-script-from-within/home/jazimmerman/.dotfiles/vim/.vim_runtime/my_configs.vim/home/jazimmerman/.dotfiles/vim/.vim_runtime/my_configs.vim
SOURCE=${BASH_SOURCE[0]}
while [ -L "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR=$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )
  SOURCE=$(readlink "$SOURCE")
  [[ $SOURCE != /* ]] && SOURCE=$DIR/$SOURCE # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR=$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )

# Run normal installation script for vim_awesome
/bin/bash $DIR/.vim_runtime/install_awesome_vimrc.sh

# Set up my_configs.vim to work with submodule
echo "Copying my_configs.vim to .vim_runtime"
install $DIR/my_configs.vim $DIR/.vim_runtime/my_configs.vim
echo "Copying my_plugins to .vim_runtime"
find my_plugins/ -type f -exec install -Dm 755 "{}" "$DIR/.vim_runtime/{}" \;

if getopts "u" opt; then
    echo "Updating plugins"
    # run update_plugins.py
    python3 $DIR/.vim_runtime/update_plugins.py
fi
