# change the default shell
sudo apt install -y zsh
chsh --shell /bin/zsh luka
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
mv ~/.zshrc.pre-oh-my-zsh ~/.zshrc
