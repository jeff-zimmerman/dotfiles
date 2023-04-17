# Run normal installation script for vim_awesome
/bin/bash ./.vim_runtime/install_awesome_vimrc.sh

# Set up my_configs.vim to work with submodule
ln -sf ../my_configs.vim ./.vim_runtime/my_configs.vim
echo "symlink created!"
