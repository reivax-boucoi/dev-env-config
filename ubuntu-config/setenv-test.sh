#! /bin/bash

LOCAL_DIR=$(dirname $0)

sudo add-apt-repository ppa:ubuntu-toolchain-r/test -y
sudo apt update
sudo apt upgrade -y
sudo apt install -y \
	build-essential gcc-7 g++-7 \
	cmake git curl python-pip \
	vim zsh zsh-syntax-highlighting

sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 100 --slave /usr/bin/g++ g++ /usr/bin/g++-7

sudo pip install powerline-status

POWERLINE_STATUS_LOCATION=$(pip show powerline-status | grep Location | cut -d' ' -f2)

wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf

sudo mv PowerlineSymbols.otf /usr/share/fonts/
sudo fc-cache -vf /usr/share/fonts/
sudo mv 10-powerline-symbols.conf /etc/fonts/conf.d/

git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
mkdir -p ~/.config/fontconfig/conf.d
mv fontconfig/50-enable-terminess-powerline.conf ~/.config/fontconfig/conf.d/
cd ..
rm -rf fonts

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "
# Powerline Font path
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
. $POWERLINE_STATUS_LOCATION/powerline/bindings/bash/powerline.sh " >> ~/.bashrc

echo "
\" Powerline Font path
set rtp+=$POWERLINE_STATUS_LOCATION/powerline/bindings/vim/
set laststatus=2
set t_Co=256 " >> ~/.vimrc

sed -i "s/ZSH_THEME=\".*\"/ZSH_THEME=\"agnoster\"/" ~/.zshrc
echo "
# Custom settings
DEFAULT_USER=$(whoami)
unsetopt nomatch " >> ~/.zshrc

mkdir -p ~/.local/share/konsole
cp $LOCAL_DIR/local/share/konsole/JucomProfile.profile ~/.local/share/konsole/
cp $LOCAL_DIR/local/share/konsole/Solarized.colorscheme ~/.local/share/konsole/

# Done by oh-my-zsh install script
#ZSH_LOCATION=$(which zsh)
#chsh -s $ZSH_LOCATION

exit

