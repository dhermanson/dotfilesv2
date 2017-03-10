sudo chsh -s $(which zsh) $(whoami)

# check if homebrew zsh already in /etc/shells
#if grep -q "/usr/local/bin/zsh" "/etc/shells"; then
#  sudo echo "/usr/local/bin/zsh" >> /etc/shells
#fi
