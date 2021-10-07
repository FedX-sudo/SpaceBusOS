{   
   networking.hostName = "SpaceBusOS"
   
     # Enable the X11 windowing system.
  services.xserver.enable = true;


  # Enable the Plasma 5 Desktop Environment.
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;
  
  programs.xwayland.enable = true;
  # Configure keymap in X11
  services.xserver.layout = "us";
  # services.xserver.xkbOptions = "eurosign:e";

  # Sound Config
  sound.enable = true;
  
  #SpaceBusOS uses pipewire be default, so have fun with this. 
  services.pipewire = {
    enable = true;
    
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };
{
