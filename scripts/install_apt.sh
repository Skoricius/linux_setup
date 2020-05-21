# update and upgrade
sudo apt update && sudo apt -y upgrade

# install a few necessary things
sudo apt install -y \
    ranger \
    git \
    curl \
    wget \
    python3.7 \
    zsh \
    imagemagick \
    netstat \
    npm \
    screen \
    grip \
    zip \
    tree

# make sure the screen is set up correctly
mkdir ~/.screen && chmod 700 ~/.screen
