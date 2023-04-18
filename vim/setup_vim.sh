#!/usr/bin/env bash

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
ln -sf $DIR/my_configs.vim $DIR/.vim_runtime/my_configs.vim
if [ -d $DIR/.vim_runtime/my_plugins  ]; then
    rm -rf $DIR/.vim_runtime/my_plugins
fi
ln -sf $DIR/my_plugins $DIR/.vim_runtime/my_plugins
echo "symlinks created!"

# run update_plugins.py
python3 $DIR/.vim_runtime/update_plugins.py
