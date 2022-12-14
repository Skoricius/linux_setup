# Programs

## Samba share
Config at `etc/samba/smb.conf`
sudo service smbd restart

## Transmission
Config at `sudo vi /etc/transmission-daemon/settings.json`
`sudo service transmission-daemon reload`
I had an issue with Transmission saying that I've been blacklisted even though whitelist was disabled. The solution was to point it to the correct settings directory:
`transmission-daemon -g /etc/transmission-daemon/`
Transmission needs to have open port 51413:
`sudo ufw allow 51413`

## Nextcloud
sudo ncp-config
Look for enable/disable web-gui. Also need to run
`sudo systemctl disable apache2`
