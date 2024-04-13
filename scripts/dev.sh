mkdir -p ~/.local/bin
sh ./set_up_neovim.sh
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
sudo apt-get install ripgrep
sh ./set_up_poetry.sh
# change version if necessary
wget https://github.com/jesseduffield/lazygit/releases/download/v0.41.0/lazygit_0.41.0_Linux_x86_64.tar.gz
tar -xf lazygit_0.41.0_Linux_x86_64.tar.gz
mv lazygit ~/.local/bin


