brew update
# zsh tools
brew install zoxide
brew install lazygit
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
cp ~/linux_setup/.zshrc ~/.zshrc
# neovim
brew install neovim
brew install ripgrep
brew install node
npm install npx
git clone git@github.com:Skoricius/nvim_config.git
mkdir -p ~/.config
mv nvim_config ~/.config/nvim

# python
brew install pyenv
pyenv install
curl -sSL https://install.python-poetry.org | python3 -

# tmux
brew install tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
cp ../.tmux.conf ~

