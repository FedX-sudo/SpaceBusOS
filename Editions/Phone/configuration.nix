# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

let
  nvidia-offload = pkgs.writeShellScriptBin "nvidia-offload" ''
    export __NV_PRIME_RENDER_OFFLOAD=1 blender
    export __NV_PRIME_RENDER_OFFLOAD_PROVIDER=NVIDIA-G0
    export __GLX_VENDOR_LIBRARY_NAME=nvidia
    export __VK_LAYER_NV_optimus=NVIDIA_only
    #export __NV_PRIME_RENDER_OFFLOAD=1 blender
    exec -a "$0" "$@"
  '';
in

{
  imports =
    [ # Include the results of the hardware scan.
     ./hardware-configuration.nix
    ];

  programs.fish.enable = true;
  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Set your time zone.
  time.timeZone = "America/Denver";

  #Kernel Config
  
  boot.kernelPackages = pkgs.linuxPackages_zen;

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  networking.interfaces.enp37s0.useDHCP = true;
  networking.interfaces.wlp0s20f3.useDHCP = true;
  
  networking.networkmanager.enable = true;

  # Configu network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  # };

  # Enable the X11 windowing system.
  services.xserver.enable = true;


  # Enable the Plasma 5 Desktop Environment.
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;
  
  services.xserver.screenSection = ''
  Option         "metamodes" "nvidia-auto-select +0+0 {ForceFullCompositionPipeline=On}"
  Option         "AllowIndirectGLXProtocol" "off"
  Option         "TripleBuffer" "on"
  '';
  #Nix packages config
   nixpkgs.config.packageOverrides = pkgs: {
    nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {
      inherit pkgs;
      };
    };
   nix = {
    package = pkgs.nixUnstable;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
   };
   nixpkgs.config.allowUnfree = true;
  # Sound config
  sound.enable = true;
    # Not strictly required but pipewire will use rtkit if it is present
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    # Compatibility shims, adjust according to your needs
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };



  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.fedx = {
      isNormalUser = true;
      shell = pkgs.fish;
      home = "/home/fedx";
      extraGroups = ["wheel" "networkmanager"];
    };


  # List services that you want to enable:
  environment.systemPackages = [ nvidia-offload ];

  services.xserver.videoDrivers = [ "modesetting" "nvidia" ];

  services.xmr-stak.cudaSupport = true;

  hardware.nvidia.prime = {
    offload.enable = true;

    # Bus ID of the Intel GPU. You can find it using lspci, either under 3D or VGA
    intelBusId = "PCI:00:02:0";

    # Bus ID of the NVIDIA GPU. You can find it using lspci, either under 3D or VGA
    nvidiaBusId = "PCI:23:00:0";
  };
  
 
 # Enable the OpenSSH daemon.
   
  services.openssh.enable = true;
	
  hardware.opengl = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver # LIBVA_DRIVER_NAME=iHD
      vaapiIntel         # LIBVA_DRIVER_NAME=i965 (older but works better for Firefox/Chromium)
      vaapiVdpau
      libvdpau-va-gl
    ];
  };

 services.cron = {
    enable = true;
    systemCronJobs = [
      
    ];
  };

  services.tlp = {
    enable = true;
    settings = 
    {
     "SATA_LINKPWR_ON_BAT" =  "med_power_with_dipm";
     "USB_BLACKLIST_PHONE" =  1;
    };
  };
  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "21.05"; # Did you read the comment?

}
