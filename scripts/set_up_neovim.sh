curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
mkdir -p ~/bin
mv nvim.appimage ~/bin/nvim.appimage
git clone --depth 1 https://github.com/AstroNvim/AstroNvim ~/.config/nvim
git clone https://github.com/Skoricius/astro_config ~/.config/nvim/lua/user
