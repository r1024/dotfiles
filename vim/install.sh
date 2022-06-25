#!/bin/sh

# install Vundle
echo "install vim-plug..."
mkdir -p ~/.vim/autoload ~/.vim/plugged
git clone https://github.com/junegunn/vim-plug.git ~/.vim/plugged/vim-plug > /dev/null 2>&1 || {
	echo "Network error, install vim-plug failed!"
	exit 1
}
cp ~/.vim/plugged/vim-plug/plug.vim ~/.vim/autoload/

echo "source ~/.vim/basic.vim" > $HOME/.vimrc 
echo "source ~/.vim/plugins.vim" >> $HOME/.vimrc

echo "Easyvim install succsess, exec :PlugInstall in VIM!"
echo ""
