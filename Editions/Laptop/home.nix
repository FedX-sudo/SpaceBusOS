{pkgs, ...}: 
let
  # Personal Info
  name = "name";
  email = "email@email.email";
  githubUsername = "user";
  # Paths
  home = "/home/$name";
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
    lfs.enable = true;
  };
    fish = {
      enable = true;
        shellAbbrs = {
         # Git abbreviations
         
       };
       interactiveShellInit = 
          ''
          starship init fish | source

          alias ll="exa -l --icons"
          
          alias ls="exa --icons"

          shinit "command_not_found_handler"

          neofetch
          

          '';
        };
    command-not-found.enable = true;
  };
  accounts.email = {
    maildirBasePath = "${maildir}";
    accounts = {
      proton = {
        address = "email@email.email";
        userName = "email@email.email";
        flavor = "plain";
        primary = true;

        mbsync = {
          enable = true;
          expunge = "both";
        };
        realName = "Real Name";
      };
      gmail = {
        address = "email@gmail.com";
        userName = "email@gmail.com";
        flavor = "gmail.com";
        passwordCommand = "${pkgs.pass}/bin/pass gmail";
        primary = false;
        mbsync = {
          enable = true;
          expunge = "both";
          patterns = [ "*" "![Gmail]*" "[Gmail]/Sent Mail" ];
        };
        realName = "Real Name";
      };
    }; 
  };  
  home = {
    packages = [
      pkgs.fd
      pkgs.ncurses
      
    ];
    file = {
      ".config/cron".text = 
      ''
        00 18 * * *     fedx     home-manager switch; nix-collect-garbage; nix-env -u
      '';
    };  
    activation = {
     myActivationAction = ''
       $DRY_RUN_CMD crontab ${home}/.config/cron
       '';
    };
  };
}
