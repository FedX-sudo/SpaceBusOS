#!/bin/env bash

echo "This is the Alpha of the SpaceBusOS installer. Proeceed with caution."

echo "Available versions:"
echo "Laptop (1)"


read -p "Please select which version you would like (1). " eddition

echo "$eddition"
if [ "$eddition" == "1" ]; then
    echo "Proceeeding with install"
    
    sudo bash $(pwd)/laptop-install-root.sh
fi

echo "Error, no eddition specified. Abborting." 
