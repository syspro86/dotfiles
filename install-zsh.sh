
# install zsh
if [ ! -f /usr/bin/zsh ]; then
    sudo apt update
    sudo apt install -y zsh
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    chsh -s "$(which zsh)"
fi

[ -f ~/.zshrc ] && rm ~/.zshrc
ln -s ~/dotfiles/.zshrc ~/.zshrc

