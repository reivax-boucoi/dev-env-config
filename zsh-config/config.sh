#!/bin/bash

# Install Oh-My-Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install Zsh plugins
git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-completions

# Setting up zshrc
sed -i "s/ZSH_THEME=\".*\"/ZSH_THEME=\"agnoster\"/" ~/.zshrc
echo "
# Custom settings
DEFAULT_USER=$(whoami)
unsetopt nomatch 
autoload -U compinit && compinit
# Add syntax highlighting for less
export LESSOPEN=\"| source-highlight -f esc-solarized.outlang --style-file=esc-solarized.style -i %s -o STDOUT\"
export LESS=' -R '
" >> ~/.zshrc

