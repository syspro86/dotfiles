
# install script for devcontainer

# install fzf
[ ! -f /usr/bin/fzf ] && sudo apt update && sudo apt install -y fzf

# install zsh vi mode
[ "${ZSH_CUSTOM}" = "" ] && ZSH_CUSTOM=~/.oh-my-zsh/custom
[ ! -d ${ZSH_CUSTOM}/plugins/zsh-vi-mode ] && git clone https://github.com/jeffreytse/zsh-vi-mode ${ZSH_CUSTOM}/plugins/zsh-vi-mode

# create symlinks
[ -f ~/.zshrc ] && rm ~/.zshrc
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
[ ! -f ~/.gitconfig ] && ln -s ~/dotfiles/.gitconfig ~
