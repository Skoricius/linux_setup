git clone git@github.com:jarun/nnn.git
cd nnn
make O_NERD=1
cp ./nnn ~/.local/bin/nnn
cd ..
rm -rf nnn
mkdir -p ~/.config/nnn/plugins
cd ~/.config/nnn/plugins
sh -c "$(curl -Ls https://raw.githubusercontent.com/jarun/nnn/master/plugins/getplugs)"

