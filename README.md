# my_linux_setup

## Setting up
1) ssh into the server and paste the github private key (or create a new pair)
2) Edit .ssh/config:
```
echo "
Host github.com
  HostName github.com
  User skoricius
  IdentityFile ~/.ssh/mygithub
 " >> ~/.ssh/config
 ```
2) Clone the git repository
```
git init ~/
git remote add origin git@github.com:Skoricius/linux_setup.git
git fetch
git checkout -t origin/master
```
3) Run parts of the scripts/linux_setup.sh that you need


## Fonts
https://github.com/microsoft/cascadia-code

# Useful commands
## Reverse ssh
```
ssh -N -L 8001:localhost:8888 luka@dreams-ai.com
```

(local-port:remote-port server-address)

## Setting up ssh key
```
ssh-keygen -t rsa -f ~/.ssh/id_rsa
ssh-copy-id -i $HOME/.ssh/id_rsa.pub user@server
```
Add ssh key to ~/.ssh/config:
```
 echo "
Host dreams-config
  HostName dreams-ai.com
  Port 222
  User root
  IdentityFile ~/.ssh/id_rsa_steve
" >> ~/.ssh/config
```

## Setting up VPN on a private server
https://github.com/StreisandEffect/streisand

## Markdown to pdf
grip <filename>.md
  
## Downloading podcasts and youtube
youtube: https://ytdl-org.github.io/youtube-dl/index.html

podcasts: https://github.com/brtmr/podfox
