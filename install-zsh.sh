
# install zsh
if [ ! -f /usr/bin/zsh ]; then
    sudo apt update
    sudo apt install -y zsh
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    chsh -s "$(which zsh)"
fi

[ ! -f /usr/bin/fzf ] && sudo apt install -y fzf

[ -f ~/.zshrc ] && rm ~/.zshrc
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf

[ "${ZSH_CUSTOM}" = "" ] && ZSH_CUSTOM=~/.oh-my-zsh/custom
[ ! -d ${ZSH_CUSTOM}/plugins/zsh-vi-mode ] && git clone https://github.com/jeffreytse/zsh-vi-mode ${ZSH_CUSTOM}/plugins/zsh-vi-mode

# install d2coding font
font_wc=$(fc-list | grep 'D2Coding' | wc -l)
if [ "$font_wc" = "0" ]; then
    mkdir -p ~/.local/share/fonts
    cd ~/.local/share/fonts
    wget https://github.com/naver/d2codingfont/releases/download/VER1.3.2/D2Coding-Ver1.3.2-20180524.zip
    unzip D2Coding-Ver1.3.2-20180524.zip
    rm -f D2Coding-Ver1.3.2-20180524.zip
    fc-cache -f -v
fi
