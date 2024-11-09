# change the default shell
sudo apt install -y zsh
sudo chsh --shell /bin/zsh $USER
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
cp ~/linux_setup/.zshrc ~/.zshrc
