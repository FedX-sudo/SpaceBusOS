# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{ config, pkgs, ... }:
let #NOSYNC
  nvidia-offload = pkgs.writeShellScriptBin "nvidia-offload"  #NOSYNC
    export __NV_PRIME_RENDER_OFFLOAD=1 #NOSYNC
    export __NV_PRIME_RENDER_OFFLOAD_PROVIDER=NVIDIA-G0 #NOSYNC
    export __GLX_VENDOR_LIBRARY_NAME=nvidia #NOSYNC 
    export __VK_LAYER_NV_optimus=NVIDIA_only #NOSYNC
    exec -a "$0" "$@" #NOSYNC"
  ''; #NOSYNC 
in #NOSYNC


{
  imports = 
    [ 
      ./hardware-configuration.nix
    ] 
  boot = { 
    kernelPackages = pkgs.linuxPackages_zen; 
    loader = { 
      systemd-boot.enable = true; 
      efi.canTouchEfiVariables = true; 
      grub.enable = false; 
    }; 
  }; 
  time.timeZone = 'America/Denver'  
  networking = { 
    hostName = 'SpaceBusOS_none'; # SPACE BUS!!!!!!! 
    useDHCP = false;
    interfaces.enp37s0.useDHCP = false; 
    interfaces.tun0.useDHCP = false; 
    interfaces.wlp0s20f3.useDHCP = false;
    networkmanager.enable = true;
    # Configure network proxy if necessary 
    # proxy = {
    #   default = "http://user:password@proxy:port/"; 
    #   noProxy = "127.0.0.1,localhost,internal.domain"; 
    # }; 
    firewall = { 
      enable = false; 
      #allowedTCPPorts = [ ... ]; 
      #allowedUDPPorts = [ ... ]; 
    }; 

  }; 


  services = { 
    xserver = { 
    enable = true; 
    displayManager.sddm.enable = true; 
    layout = 'us'; 
    libinput.enable = true; 
    videoDrivers = [ "modesetting" "nvidia" ]; #NOSYNC
     screenSection = '' #NOSYNC
      Option         "metamodes" "nvidia-auto-select +0+0 {ForceFullCompositionPipeline=On}" #NOSYNC 
      Option         "AllowIndirectGLXProtocol" "off" #NOSYNC 
      Option         "TripleBuffer" "on" #NOSYNC 
  ''; 
  openssh.enable = ture;
  printing.enable = ture;
  pipewire = {
    enable = true
    alsa = { 
      enable = ture;
      support32bit = ture;
    }; 
    pulse.enable = true;
    jack.enable = true;
  };
xmr-stack.cudaSupport = true; #NOSYNC
tlp = {
  enable = true;
  settings = { 
     "SATA_LINKPWR_ON_BAT" =  "med_power_with_dipm"; 
     "USB_BLACKLIST_PHONE" = 1; 
  }; 
};
};
  sound.enable = true;
  user.users.astronoght = {
    isNormalUser = true; 
    shell = pkgs.fish; 
    extraGroups = [ "networkmanager" "wheel" "kvm" "podman" "video"]; 
  }; 
  nix = { 
    package = pkgs.nixUnstable; 
    extra options = '' 
      experimental-features = ni-command flakes
    ''; 
  }; 
  nixpkgs = { 
    config = { 
    packageOverride = pkgs: { 
      nur = import (builtins.fetchTarball https://github.com/nix-community/NUR/archive/master.tar.gz) { inherit pkgs; }; 
    }; 
  }; 
  environment.systemPackages = with pkgs; [ 
    neovim 
    fish 
    brightnessctl 
  ]; 
