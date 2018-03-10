#! /bin/bash

sudo apt install git curl python-pip vim

sudo pip install powerline-status

POWERLINE_STATUS_LOCATION=$(pip show powerline-status | grep Location | cut -d' ' -f2)

wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf

sudo mv PowerlineSymbols.otf /usr/share/fonts/
sudo fc-cache -vf /usr/share/fonts/
sudo mv 10-powerline-symbols.conf /etc/fonts/conf.d/

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

sudo apt-get install zsh

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

sed -i "s/ZSH_THEME=\".*\"/ZSH_THEME=\"agnoster\"/" ~/.zshrc
echo "
# Custom settings
unsetopt nomatch " >> ~/.zshrc

ZSH_LOCATION=$(which zsh)
chsh -s $ZSH_LOCATION

git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
mkdir -p ~/.config/fontconfig/conf.d
mv fontconfig/50-enable-terminess-powerline.conf ~/.config/fontconfig/conf.d/
cd ..
rm -rf fonts

exit

