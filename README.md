# my_linux_setup

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

## Markdown to pdf
grip <filename>.md

# TODO:
- need to set up my ssh config and add keys separately
