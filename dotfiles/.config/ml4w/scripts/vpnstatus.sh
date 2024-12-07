#!/bin/bash

# Read the VPN status file
status=$(cat /home/tristan/.config/vpnstatus)

# Generate JSON based on the status
if [[ "$status" == "VPN > "* ]]; then
    connection="${status#VPN > }"
    echo "{\"text\": \"VPN: $connection\", \"tooltip\": \"Connected to $connection\", \"alt\": \"connected\"}"
elif [[ "$status" == "Proton > "* ]]; then
    connection="${status#Proton > }"
    echo "{\"text\": \"ProtonVPN: $connection\", \"tooltip\": \"Connected to ProtonVPN - $connection\", \"alt\": \"connected\"}"
elif [[ "$status" == "VPN Down" ]]; then
    echo "{\"text\": \"\", \"alt\": \"off\"}"
else
    echo "{\"text\": \"Unknown\", \"tooltip\": \"Status unclear\", \"alt\": \"off\"}"
fi
