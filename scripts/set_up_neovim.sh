sudo apt install -y neovim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
git clone https://github.com/nvim-lua/kickstart.nvim
mkdir -p ~/.config/nvim 
cp -r kickstart.nvim/* ~/.config/nvim/

