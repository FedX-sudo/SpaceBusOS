# This is where the majority of the [SpaceBusOS] Nix configuration changes live. 

{   


   # [SpaceBusOS] enables the NUR by default
   nixpkgs.config.packageOverrides = pkgs: {
    nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {
      inherit pkgs;
      };
    };
  
   environment.systemPackages = with pkgs; [
     neovim
     tealdeer
     brave
     fish
     starship
   ];

   networking.hostName = "SpaceBusOS"
   
   # Enable the X11 windowing system.
  services.xserver.enable = true;


  # Enable the Plasma 5 Desktop Environment.
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;
  programs.xwayland.enable = true;

  # Sound Config
  sound.enable = true;
  
  #SpaceBusOS uses pipewire be default. 
  services.pipewire = {
    enable = true;
    
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };
{
