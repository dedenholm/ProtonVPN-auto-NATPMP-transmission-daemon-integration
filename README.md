# fork of giu176's ProtonVpn-autoNATPMP with integration for updating transmission-daemons listening port through transmission-remote.

## installation

Download the script:
 ```sh
curl https://raw.githubusercontent.com/dedenholm/ProtonVPN-auto-NATPMP-transmission-daemon-integration/main/natpmpc_script_transmission.sh -o natpmpc_script.sh
```
 Give execute permission:
 ```sh
chmod +x natpmpc_script.sh
```
Now you are ready to launch the script:
 ```sh
./natpmpc_script.sh
```
This will enable port forwarding on the ProtonVPN server, a random port will be assigned. The port will be closed 60 seconds after you close the script with `ctrl+C`.

## the transmission-daemon integration checks for port changes and calls transmission-remote to update the listening port


### use openrc service file:

download the script to openrc init folder
```sh 
curl https://raw.githubusercontent.com/dedenholm/ProtonVPN-auto-NATPMP-transmission-daemon-integration/main/openrc-init-script -o /etc/init.d/autonatpmpc
```
make executable 
```sh
chmod +x /etc/init.d/autonatpmpc
```

add the script to default runlevel
```sh
rc-update add autonatpmpc
```

start the script 


```sh 
rc-service autonatpmpc start
```

if you have a wireguard service script, edit the autonatpmpc service file to add the wireguard service to its dependencies
