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

# Install remotes
cd $DIR/..
echo "Installing vim-runtime"
git subtree add --prefix $DIR/.vim_runtime/vim_runtime vim-runtime master --squash
while read -r line; do
    if [[ $line == "origin" ]]; then
        continue
    fi
    echo "Installing $line"
    git subtree -q add --prefix $DIR/.vim_runtime/my_plugins/$line $line master --squash || git subtree -q pull --prefix $dir/.vim_runtime/my_plugins/$line $line main --squash || git subtree -q add --prefix $DIR/.vim_runtime/my_plugins/$line $line main --squash || git subtree -q pull --prefix $dir/.vim_runtime/my_plugins/$line $line master --squash 2>/dev/null
done <<< "$( git remote )" # get all remotes
cd $DIR

# Run normal installation script for vim_awesome
/bin/bash $DIR/.vim_runtime/install_awesome_vimrc.sh

# add vimspector config
# echo "Copying vimspector config"
# make directory if it doesn't exist
# mkdir -p $DIR/my_plugins/vimspector/configurations/linux/python
# cat > $DIR/.vim_runtime/my_plugins/vimspector/configurations/linux/python/python.json << "EOF"
# { // This file was added by vimspector-py
#   "$schema": "https://puremourning.github.io/vimspector/schema/vimspector.schema.json",
#   "configurations": {
#     "debug this file": {
#       "adapter": "debugpy",
#       "variables": {
#         "Python": {
#           "shell": "/bin/sh -c 'if [ -z \"${dollar}VIRTUAL_ENV\" ]; then echo $$(which python3); else echo \"${dollar}VIRTUAL_ENV/bin/python\"; fi'"
#         }
#       },
#       "configuration": {
        # "type": "python",
        # "autoselect": true,
        # "request": "launch",
        # "cwd": "${workspaceRoot}",
        # "stopOnEntry": false,
        # "justMyCode": false,
        # "python": "$Python",
        # "program": "${file}",
        # "args": [ "*${CommandLineArgs}" ]
      # },
      # "breakpoints": {
        # "exception": {
        #   "caught": "N",
        #   "uncaught": "Y"
        # }
      # }
    # }
  # }
# }
# EOF

# set up my_configs.vim to work with submodule
echo "copying my_configs.vim to .vim_runtime"
ln -sf $DIR/my_configs.vim $DIR/.vim_runtime/my_configs.vim
echo "linking after to .vim_runtime"
ln -sf $DIR/after $DIR/.vim_runtime/after
# echo "copying my_plugins to .vim_runtime"
# rsync -a $DIR/my_plugins/ $DIR/.vim_runtime/my_plugins/

if getopts "u" opt; then
    echo "Updating plugins"
    # run update_plugins.py
    python3 $DIR/.vim_runtime/update_plugins.py
fi
