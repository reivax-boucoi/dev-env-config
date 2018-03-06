#! /bin/bash

echo Adding ubuntu-toolchain-r PPA...
sudo add-apt-repository ppa:ubuntu-toolchain-r/test -y
echo Upgrading the system...
sudo apt update
sudo apt upgrade -y
echo Installing native-toolchain...
sudo apt install -y build-essential git cmake gcc-6 g++-6 gcc-7 g++-7

sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-6 100 --slave /usr/bin/g++ g++ /usr/bin/g++-6
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 100 --slave /usr/bin/g++ g++ /usr/bin/g++-7

echo Installing powerline...
sudo apt install -y python-pip
sudo pip install powerline-status
sudo apt install -y fonts-powerline

POWERLINE_DIR=$(pip show powerline-status | grep Location | cut -d' ' -f2)/powerline
echo Powerline location: $POWERLINE_DIR

echo Installing Oh-My-Zsh...
sudo apt install -y zsh zsh-syntax-highlighting
wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O - | bash

echo Updating ~/.vimrc
echo \" Powerline Font Path >> ~/.vimrc
echo set rtp+=$POWERLINE_DIR/bindings/vim/ >> ~/.vimrc
echo set laststatus=2 >> ~/.vimrc
echo set t_Co=256 >> ~/.vimrc

echo Updating ~/.zshrc
echo ZSH_THEME="agnoster" >> ~/.zshrc
echo DEFAULT_USER=$(whoami) >> ~/.zshrc
echo unsetopt nomatch >> ~/.zshrc
echo source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh >> ~/.zshrc
