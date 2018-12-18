#! /bin/bash

LOCAL_DIR=$(dirname $0)

# Update system and install some packages
sudo apt update
sudo apt upgrade -y
sudo apt install -y \
	build-essential gcc g++ cmake git \
	vim zsh tmux powerline powerline-fonts

# Install Oh-My-Zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

# Install Zsh plugins
git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-completions

# Setting up git
git config --global color.ui true
git config --global core.editor "vim"
git config --global user.email "julien.combattelli@hotmail.com"
git config --global user.name "Julien Combattelli"

# Setting up tmux
cp .tmux.conf ~

# Setting up bashrc
cat .bashrc.append >> ~/.bashrc

# Setting up vimrc
cat .vimrc.append >> ~/.vimrc

# Setting up zshrc
sed -i "s/ZSH_THEME=\".*\"/ZSH_THEME=\"agnoster\"/" ~/.zshrc # Set agnoster theme
sed -i "s/\(^plugins=([^)]*\)/\1\n  zsh-syntax-highlighting/" .zshrc # Add some basic plugins
cat .zshrc.append >> ~/.zshrc

# Setting up konsole
mkdir -p ~/.local/share/konsole
cp $LOCAL_DIR/local/share/konsole/JucomProfile.profile ~/.local/share/konsole/
cp $LOCAL_DIR/local/share/konsole/Solarized.colorscheme ~/.local/share/konsole/

# Done by oh-my-zsh install script
#ZSH_LOCATION=$(which zsh)
#chsh -s $ZSH_LOCATION

exit

