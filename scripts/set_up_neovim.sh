curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
mkdir -p ~/.local
mkdir -p ~/.local/bin
mv nvim.appimage ~/.local/bin/nvim.appimage
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
git clone git@github.com:Skoricius/nvim_config.git
