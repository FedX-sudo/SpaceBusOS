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
      ".config/starship.toml".text = 
      ''
         # ~/.config/starship.toml

# Use custom format
format = """
[┌─>](bold green)$directory$username$hostname$nix_shell$cmd_duration$status
[│](bold green)$git_branch$git_commit$git_status$docer_context$golang$julia$python$php$rust
[└─>](bold green) """

right_format = "$character"
# Wait 10 milliseconds for starship to check files under the current directory.
scan_timeout = 10

# Disable the blank line at the start of the prompt
add_newline = false

[nix_shell]
format = ' [$state( \($name\))]($style) '
disabled = false
impure_msg = "[ ](bold red)"
pure_msg = "[ ](bold green)"

[character]
success_symbol = "[➜](bold green) "
error_symbol = "[✗](bold red) "

[directory]
truncation_length = 8
read_only = " "

[docker_context]
symbol = " "

[cmd_duration]
min_time = 500
format = "underwent [$duration](bold yellow)"
show_notifications = true
min_time_to_notify = 1000

[git_branch]
symbol = " "

[git_commit]
tag_disabled = false
tag_symbol = "🏷  "

[git_status]
conflicted = "= "
ahead = "⇡${count} "
diverged = "⇕⇡${ahead_count}⇣${behind_count} "
behind = "⇣${count} "
untracked = "? "
stashed = "📦 "
modified = "  "
deleted = "🗑 "

[golang]
symbol = " "

[julia]
symbol = " "

[package]
symbol = " "

[php]
symbol = " "

[python]
symbol = " "

[rust]
symbol = " "


[hostname]
ssh_only = false
format =  "on [$hostname](bold red) "
trim_at = ".companyname.com"
disabled = false

[username]
style_user = "grey bold"
style_root = "black bold"
format = "[$user  ]($style) "
disabled = false
show_always = true

      '';
    };  
    activation = {
     myActivationAction = ''
       $DRY_RUN_CMD crontab ${home}/.config/cron
       '';
    };
  };
}
