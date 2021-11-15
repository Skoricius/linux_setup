# update and upgrade
#sudo apt update && sudo apt -y upgrade

# install a few necessary things
sudo apt install -y \
    ranger \
    git \
    curl \
    wget \
    rsync \
    python3 \
    zsh \
    imagemagick \
    screen \
    grip \
    zip \
    tree \
    neovim

# make sure the screen is set up correctly
mkdir ~/.screen && chmod 700 ~/.screen
