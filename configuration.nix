# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

let #NOSYNC
  nvidia-offload = pkgs.writeShellScriptBin "nvidia-offload" '' #NOSYNC
    export __NV_PRIME_RENDER_OFFLOAD=1 #NOSYNC
    export __NV_PRIME_RENDER_OFFLOAD_PROVIDER=NVIDIA-G0 #NOSYNC
    export __GLX_VENDOR_LIBRARY_NAME=nvidia #NOSYNC
    export __VK_LAYER_NV_optimus=NVIDIA_only #NOSYNC
    #export __NV_PRIME_RENDER_OFFLOAD=1 blender #NOSYNC 
    exec -a "$0" "$@" #NOSYNC
  ''; #NOSYNC
in #NOSYNC


{
  imports =
    [ # Include the results of the hardware scan.
      #./hardware-configuration.nix
    ];
    #musnix.enable = false;

  # Use the systemd-boot EFI boot loader.
  boot = {
    #kernelPackages = pkgs.linuxPackages_zen;
    supportedFilesystems = ["bcachefs"];
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      grub.enable = false;
    };
  };
  time.timeZone = "America/Denver";
  networking = {
    hostName = "SpaceBusOS_galp"; # SPACE BUS!!!!!!!
    useDHCP = false; 
    interfaces.enp37s0.useDHCP = false;
    interfaces.tun0.useDHCP = false;
    interfaces.wlp0s20f3.useDHCP = false;
    #nameservers = ["100.117.34.29" "9.9.9.9"];
    #resolvconf.enable = false;

    networkmanager = {
      enable = true;
      #dns = "none";
      wifi = {
        scanRandMacAddress = true;
        #macAddress = "random";
      };
      ethernet = {
        macAddress = "random";
      };
    };
    firewall = {
      enable = false;
      #trustedInterfaces = [ "tailscale0" ];
      #allowedTCPPorts = [ ... ];
      #allowedUDPPorts = [ ... ];
    };

  };  
  services = {
    tailscale.enable = true;

    xserver = {
      enable = true;
      #displayManager.sddm.enable = true;
      #desktopManager.plasma5.enable = true;
      layout = "us";
      libinput.enable = true;
      videoDrivers = [ "modesetting" "nvidia" ]; #NOSYNC
      #desktopManager = {
      #  default = "xfce";
      #  xterm.enable = false;
      #  xfce = {
      # 
        screenSection = '' #NOSYNC
          Option         "metamodes" "nvidia-auto-select +0+0 {ForceFullCompositionPipeline=On}" #NOSYNC
          Option         "AllowIndirectGLXProtocol" "off" #NOSYNC
          Option         "TripleBuffer" "on" #NOSYNC
        '';
    };
    openssh.enable = true;
    printing.enable = false;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };
    xmr-stak.cudaSupport = true; #NOSYNC
    tlp = {
      enable = true;
      settings = {
        "SATA_LINKPWR_ON_BAT" =  "med_power_with_dipm";
        "USB_BLACKLIST_PHONE" =  1;
      };
    };
  };
  systemd.units."sys-subsystem-net-devices-tun0.device".enable = false;
  # Enable sound.
  sound.enable = true;  
 
  users.users.fedx = {
     isNormalUser = true;

     extraGroups = [ "networkmanager" "wheel" "kvm" "podman" "video" "audio" "kismet"]; 
  };
  nix = {
    package = pkgs.nixUnstable;
   extraOptions = ''
      experimental-features = nix-command flakes
   '';
   settings = {
     trusted-users = [ "root" "fedx" ];
     auto-optimise-store = true;
   };
  };
  programs.sway = {
  enable = true;
  wrapperFeatures.gtk = true; # so that gtk works properly
  extraPackages = with pkgs; [
    swaylock
    swayidle
    wl-clipboard
    mako # notification daemon
    swaybg
    alacritty # Alacritty is the default terminal in the config
    dmenu # Dmenu is the default in the config but i recommend wofi since its wayland native
  ];
};
  nixpkgs = {
    config = {
      allowUnfree = true;
      packageOverrides = pkgs: {
        nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") { inherit pkgs; };
      };
    };
    overlays = [
     (self: super: {
     neovim = super.neovim.override {
       viAlias = true;
       vimAlias = true;
     };
   })
    ];
  };

  environment.systemPackages = with pkgs; [
     neovim 
     fish
     nvidia-offload #NOSYNC
     arion
     #docker-client
     brightnessctl
     
  ];
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "21.11"; # Did you read the comment?

}


