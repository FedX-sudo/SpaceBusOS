# Official configuration.nix of the [SpaceBusOS] Project. 
# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      ./spacebusos-configuration.nix
    ];
   # Boot loader config
   # MAKE SURE YOU SET A BOOTLOADER!!
   
   # Enable the next two settings if you wish to EFI boot
   # boot.loader.systemd-boot.enable = true; #enables the Systemd bootloader
   # boot.loader.efi.canTouchEfiVariables = true; 
   
   # Set your time zone.
   # time.timeZone = "";
   

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "21.05"; # Did you read the comment?

   
  
      
}

