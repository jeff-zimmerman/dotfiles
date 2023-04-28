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

sed -i "/my_plugins/d" $DIR/.vim_runtime/.gitignore

# Run normal installation script for vim_awesome
/bin/bash $DIR/.vim_runtime/install_awesome_vimrc.sh

# set up my_configs.vim to work with submodule
echo "linking my_configs.vim to .vim_runtime"
ln -sf $DIR/my_configs.vim $DIR/.vim_runtime/my_configs.vim
echo "linking after to .vim_runtime"
rm -rf $DIR/.vim_runtime/after
ln -sf $DIR/after $DIR/.vim_runtime/after
echo "linking my_plugins to .vim_runtime"
rm -rf $DIR/.vim_runtime/my_plugins
ln -sf $DIR/my_plugins $DIR/.vim_runtime/my_plugins

if getopts "u" opt; then
    echo "Updating plugins"
    # run update_plugins.py
    python3 $DIR/.vim_runtime/update_plugins.py
    # update vimspector
    # echo "Updating vimspector"
    vim -c "VimspectorpyUpdate"
fi
