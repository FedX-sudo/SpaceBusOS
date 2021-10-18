#!/bin/env bash

echo "Installing SpaceBusOS Laptop eddition"
echo "making a backup of configuration.nix at /etc/nixos/configuration.nix.bak"

mv /etc/nixos/configuration.nix /etc/nixos/configuration.nix.bak

echo "
# This is the official SpaceBusOS system configuration file which has been automaticaly generated.

#For more info see the SpaceBusOS wiki at fedx-sudo.github.io/SpaceBusOS-wiki

{ config, pkgs, ... }:" >> /etc/nixos/configuration.nix

if lspci | grep "NVIDIA"; then
    read -p "A Nvidia GPU was dettected, would you like to install the Nvidia proprietery drivers (y/n)? " tempvar
    if [ "$tempvar" == "y" ]; then 
        echo "Setting a Nvidia Optimus config"
        echo "
# Nvidia Optimus config
let
  nvidia-offload = pkgs.writeShellScriptBin "nvidia-offload" ''
  export __NV_PRIME_RENDER_OFFLOAD=1 blender
  export __NV_PRIME_RENDER_OFFLOAD_PROVIDER=NVIDIA-G0
  export __GLX_VENDOR_LIBRARY_NAME=nvidia
  export __VK_LAYER_NV_optimus=NVIDIA_only
  exec -a "$0" "$@"
'';
in " >> /etc/nixos/configuration.nix
        echo "{" >> /etc/nixos/configuration.nix
        echo "# Nvidia settings" >> /etc/nixos/configuration.nix
        echo "environment.systemPackages = [ nvidia-offload ];" >> /etc/nixos/confiugration.nix

        echo "services.xmr-stak.cudaSupport = true;" >> /etc/nixos/configuration.nix

        echo 'services.xserver.videoDrivers = [ "modesetting" "nvidia" ];' >> /etc/nixos/configuration.nix

        echo "hardware.nvidia.prime = {" >> /etc/nixos/configuration.nix
        echo " offload.enable = true;" >> /etc/nixos/configuration.nix
        echo "intelBusId = " $( lspci | grep 'Intel Corporation' | grep 'Graphics' | cut -c 1-7 |  sed 's/\./:/g' ) "" >> /etc/nixos/configuration.nix
        echo "NvidiaBusId = " $( lspci | grep "NVIDIA" | cut -c 1-7 |  sed 's/\./:/g' ) "" >> /etc/nixos/configuration.nix
        echo "}" >> /etc/nixos/configuration.nix
    
    fi
fi


