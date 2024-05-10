#!/bin/bash
while true; do
    
    date
     
    # Run natpmpc for UDP and TCP, redirect output to a temporary file
    natpmpc -a 1 0 udp 60 -g 10.2.0.1 && natpmpc -a 1 0 tcp 60 -g 10.2.0.1  || { 
        echo -e "ERROR with natpmpc command \a"
        break
    }

    # Extract the port numbers from the output and save them in variables
    port=$(grep 'TCP' /tmp/natpmpc_output | grep -o 'Mapped public port [0-9]*' | awk '{print $4}')

    echo "Opened port: $port"  
    # Get the current listenport from transmission-remote
    current_port=$(transmission-remote --session-info | grep 'Listenport:' | grep -o '[0-9]\+')
    
    # Check if $current_port is different from $port
  
    if [ "$current_port" != "$port" ]; then
	
	echo "port changed -- updating transmission port" >> $logfile    
	
    transmission-remote -p $port  
    
    fi
    sleep 45
done
