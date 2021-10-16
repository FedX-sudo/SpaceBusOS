{pkgs, ...}: 
let
  # Personal Info
  name = "fedx";
  email = "fedx-sudo@pm.me";
  githubUsername = "fedx-sudo";
  # Paths
  home = "/home/fedx";
  dots = "${home}/Dotfiles/dots";
  scripts = "/home/jon/Dotfiles/scripts";
  maildir = "/home/jon/Mail";
  # Preferences
  font = "Hack";
  backgroundColor = "#243442"; # Blue steel
  foregroundColor = "#deedf9"; # Light blue
  warningColor = "#e23131"; # Reddish
  lockCmd = "${pkgs.i3lock-fancy}/bin/i3lock-fancy -p -t ''";
in
{
  programs = {
    git = {
    enable = true;
    userName = "fedx-sudo";
    userEmail = "fedx-sudo@pm.me";
    lfs.enable = true;
    };
  };
  accounts.email = {
    maildirBasePath = "${maildir}";
    accounts = {
      proton = {
        address = "fenixguthrie@protonmail.com";
        userName = "fenixguthrie@protonmail.com";
        flavor = "plain";
        primary = true;

        mbsync = {
          enable = true;
          expunge = "both";
          patterns = [ "*" "![Gmail]*" "[Gmail]/Sent Mail" ];
        };
        realName = "Fenix Guthrie";
      };
      gmail = {
        address = "2057018@jefffcoschools.us";
        userName = "2057018@jeffcoschools.us";
        flavor = "gmail.com";
        passwordCommand = "${pkgs.pass}/bin/pass gmail";
        primary = false;
        mbsync = {
          enable = true;
          expunge = "both";
          patterns = [ "*" "![Gmail]*" "[Gmail]/Sent Mail" ];
        };
        realName = "Fenix Guthrie";
      };
    }; 
  };  
  home = {
    packages = [
      pkgs.fd
      pkgs.ncurses
      pkgs.pacman
    ];
    file = {
      ".config/cron".text = 
      ''
        00 18 * * *     fedx     home-manager switch; nix-collect-garbage; nix-env -u
      '';
    };  
    activation = {
     myActivationAction = ''
       $DRY_RUN_CMD crontab /home/fedx.config/cron
       '';
    };
  };
}
