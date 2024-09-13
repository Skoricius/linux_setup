mkdir -p ~/.local/bin
sh ./set_up_zsh.sh
sh ./set_up_neovim.sh
sudo apt-get install ripgrep
sh ./set_up_poetry.sh
# change version if necessary
wget https://github.com/jesseduffield/lazygit/releases/download/v0.41.0/lazygit_0.41.0_Linux_x86_64.tar.gz
tar -xf lazygit_0.41.0_Linux_x86_64.tar.gz
mv lazygit ~/.local/bin

curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
cp ../.tmux.conf ~

