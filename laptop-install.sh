#!/bin/env bash

echo "Installing SpaceBusOS Laptop eddition"
echo "making a backup of configuration.nix at /etc/nixos/configuration.nix.bak"

mv /etc/nixos/configuration/nix /etc/nixos/configuration.nix.bak

echo "
# This is the official SpaceBusOS system configuration file which has been automaticaly generated.

#For more info see the SpaceBusOS wiki at fedx-sudo.github.io/SpaceBusOS-wiki

{ config, pkgs, ... }:" >> /etc/nixos/configuration.nix

if lspci | grep nvidia ||; then
    if [ $( read -p "A Nvidia GPU was detected, would you like to install the Nvidia proprietery driver? (y/n) " ) == "y" ]; then 
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
        echo"
        # Nvidia settings

        environment.systemPackages = [ nvidia-offload ];

        services.xmr-stak.cudaSupport = true;

        services.xserver.videoDrivers = [ "modesetting" "nvidia" ];

        hardware.nvidia.prime = {
          offload.enable = true;
          intelBusId = "$( lspci | grep "Intel Corporation" | grep "Graphics" | cut -c 1-7 |  sed 's/\./:/g' )"
          NvidiaBusId = "$( lspci | grep "NVIDIA" | cut -c 1-7 |  sed 's/\./:/g' )"
        }

        " >> /etc/nixos/configuration.nix
    
    fi
fi


