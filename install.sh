
# install script for devcontainer

# install fzf
[ ! -f /usr/bin/fzf ] && sudo apt install -y fzf

# install zsh vi mode
[ "${ZSH_CUSTOM}" = "" ] && ZSH_CUSTOM=~/.oh-my-zsh/custom
[ ! -d ${ZSH_CUSTOM}/plugins/zsh-vi-mode ] && git clone https://github.com/jeffreytse/zsh-vi-mode ${ZSH_CUSTOM}/plugins/zsh-vi-mode
