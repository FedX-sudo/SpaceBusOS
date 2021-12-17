# ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
# ||/////||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||/////||
# ||//||||||||/////|||||||||||||||||||||||||||||||||||||||||||||///////|||||||||||||||||||||||||//////||||//////||||||||//||
# ||//||||||//|||||||||//////|||||/////|||||||////||||||////||||//||||//|||/||||//||||/////||||//||||//||//|||||||||||||//||
# ||//|||||||/////|||||//||||/|||||||||//|||//||||||||//||||/|||///////||||/||||//|||//||||||||/|||||//|||//////||||||||//||
# ||//||||||||||||//|||//||||//|||///////||//||||||||////////|||//||||//|||/||||//||||/////||||/|||||//||||||||//|||||||//||
# ||//||||||||||||//|||//||||/|||//||||//|||//||||||||/|||||||||//||||//|||/||||//||||||||//|||//||||/|||||||||//|||||||//||
# ||//|||||||//////||||//////|||||////||/|||||////||||||/////|||//////||||||///||/|||//////||||||////|||||//////||||||||//||
# ||/////||||||||||||||//||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||/////||
# |||||||||||||||||||||//|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
# ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
let
    syncHosts = (
        "100.86.122.32"
        100.73.33.111
    );
in
{pkgs, ...}: 
{
  programs = {
   nushell = {
    enable = true;
    settings = {
    startup = [
      "mkdir ~/.cache/starship"
      "starship init nu | save ~/.cache/starship/init.nu"
      "source ~/.cache/starship/init.nu"
      "bash ~/.config/sbos-prompt"
     ];
     prompt = "starship_prompt";
    };
  };
  zsh = {
    enable = true;
    initExtra =
    ''
        # ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
        # ||/////||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||/////||
        # ||//||||||||/////|||||||||||||||||||||||||||||||||||||||||||||///////|||||||||||||||||||||||||//////||||//////||||||||//||
        # ||//||||||//|||||||||//////|||||/////|||||||////||||||////||||//||||//|||/||||//||||/////||||//||||//||//|||||||||||||//||
        # ||//|||||||/////|||||//||||/|||||||||//|||//||||||||//||||/|||///////||||/||||//|||//||||||||/|||||//|||//////||||||||//||
        # ||//||||||||||||//|||//||||//|||///////||//||||||||////////|||//||||//|||/||||//||||/////||||/|||||//||||||||//|||||||//||
        # ||//||||||||||||//|||//||||/|||//||||//|||//||||||||/|||||||||//||||//|||/||||//||||||||//|||//||||/|||||||||//|||||||//||
        # ||//|||||||//////||||//////|||||////||/|||||////||||||/////|||//////||||||///||/|||//////||||||////|||||//////||||||||//||
        # ||/////||||||||||||||//||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||/////||
        # |||||||||||||||||||||//|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
        # ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
        eval "$(starship init zsh)"

        alias ll="exa -l --icons"

        alias ls="exa --icons"

        bash ~/.config/sbos-prompt
    '';
  };
  bash = {
    enable = true;
    initExtra =
    ''
        # ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
        # ||/////||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||/////||
        # ||//||||||||/////|||||||||||||||||||||||||||||||||||||||||||||///////|||||||||||||||||||||||||//////||||//////||||||||//||
        # ||//||||||//|||||||||//////|||||/////|||||||////||||||////||||//||||//|||/||||//||||/////||||//||||//||//|||||||||||||//||
        # ||//|||||||/////|||||//||||/|||||||||//|||//||||||||//||||/|||///////||||/||||//|||//||||||||/|||||//|||//////||||||||//||
        # ||//||||||||||||//|||//||||//|||///////||//||||||||////////|||//||||//|||/||||//||||/////||||/|||||//||||||||//|||||||//||
        # ||//||||||||||||//|||//||||/|||//||||//|||//||||||||/|||||||||//||||//|||/||||//||||||||//|||//||||/|||||||||//|||||||//||
        # ||//|||||||//////||||//////|||||////||/|||||////||||||/////|||//////||||||///||/|||//////||||||////|||||//////||||||||//||
        # ||/////||||||||||||||//||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||/////||
        # |||||||||||||||||||||//|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
        # ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
        eval "$(starship init bash)"

        alias ll="exa -l --icons"

        alias ls="exa --icons"

        bash ~/.config/sbos-prompt
    '';
  };
  git = {
    enable = true;
    lfs.enable = true;
    extraConfig = {
      pager = {
        diff = "delta";
        log = "delta";
        reflog = "delta";
        show = "delta";
      };
      interactive.diffFilter =" delta --color-only --features=interactive";
      delta = {
        features = "decorations";
        interactive.keep-plus-minus-markers = "false";
        decorations = {
          commit-decoration-style = "blue ol";
          commit-style = "raw";
          file-style = "omit";
          hunk-header-decoration-style = "blue box";
          hunk-header-file-style = "red";
          hunk-header-line-number-style = "#067a00";
          hunk-header-style = "file line-number syntax";
        };
      };
    core.editor = "nvim";
    merge.conflictstyle = "diff3";
  };
  };
  fish = {
      enable = true;
         
       interactiveShellInit = 
          ''
            # ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
            # ||/////||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||/////||
            # ||//||||||||/////|||||||||||||||||||||||||||||||||||||||||||||///////|||||||||||||||||||||||||//////||||//////||||||||//||
            # ||//||||||//|||||||||//////|||||/////|||||||////||||||////||||//||||//|||/||||//||||/////||||//||||//||//|||||||||||||//||
            # ||//|||||||/////|||||//||||/|||||||||//|||//||||||||//||||/|||///////||||/||||//|||//||||||||/|||||//|||//////||||||||//||
            # ||//||||||||||||//|||//||||//|||///////||//||||||||////////|||//||||//|||/||||//||||/////||||/|||||//||||||||//|||||||//||
            # ||//||||||||||||//|||//||||/|||//||||//|||//||||||||/|||||||||//||||//|||/||||//||||||||//|||//||||/|||||||||//|||||||//||
            # ||//|||||||//////||||//////|||||////||/|||||////||||||/////|||//////||||||///||/|||//////||||||////|||||//////||||||||//||
            # ||/////||||||||||||||//||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||/////||
            # |||||||||||||||||||||//|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
            # ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
            starship init fish | source

            alias ll="exa -l --icons"
          
            alias ls="exa --icons"

            mcfly init fish | source

            bash ~/.config/sbos-prompt
          '';
        };
        
  };
  home = {
    packages = [
      pkgs.fd
      pkgs.ffmpeg
      pkgs.makeWrapper
      pkgs.delta
      pkgs.ag
      pkgs.mcfly
      pkgs.cheat
      pkgs.gping
      pkgs.procs
      pkgs.httpie
      pkgs.curlie
      pkgs.zoxide
      pkgs.dogdns
      pkgs.arp-scan
      pkgs.gh
      pkgs.nodejs
      pkgs.lsb-release
      pkgs.tailscale
      pkgs.ripgrep
      pkgs.exa
      pkgs.brave
      pkgs.yakuake
      pkgs.prusa-slicer
      pkgs.libsForQt5.plasma-vault
      pkgs.firefox
      pkgs.libqalculate
      pkgs.wget
      pkgs.bat
      pkgs.tealdeer
      pkgs.libsForQt5.ark
      pkgs.libsForQt5.kdeconnect-kde
      pkgs.rustscan
      pkgs.krita
      pkgs.kate
      pkgs.mysql
      pkgs.neofetch
      pkgs.hyperfine
      pkgs.duf
      pkgs.iptables
      pkgs.speedtest-cli
      pkgs.starship
      pkgs.traceroute
      pkgs.niv
      pkgs.elvish
      pkgs.ion
      pkgs.ripgrep-all
      pkgs.imagemagick6Big
      pkgs.zip
      pkgs.tcsh
      pkgs.xonsh
      pkgs.hack-font
      pkgs.bottom
    ];
    file = {
      ".config/cron".text =

      ''

      '';
      ".config/sbos-prompt".text =
      ''
        # ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
        # ||/////||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||/////||
        # ||//||||||||/////|||||||||||||||||||||||||||||||||||||||||||||///////|||||||||||||||||||||||||//////||||//////||||||||//||
        # ||//||||||//|||||||||//////|||||/////|||||||////||||||////||||//||||//|||/||||//||||/////||||//||||//||//|||||||||||||//||
        # ||//|||||||/////|||||//||||/|||||||||//|||//||||||||//||||/|||///////||||/||||//|||//||||||||/|||||//|||//////||||||||//||
        # ||//||||||||||||//|||//||||//|||///////||//||||||||////////|||//||||//|||/||||//||||/////||||/|||||//||||||||//|||||||//||
        # ||//||||||||||||//|||//||||/|||//||||//|||//||||||||/|||||||||//||||//|||/||||//||||||||//|||//||||/|||||||||//|||||||//||
        # ||//|||||||//////||||//////|||||////||/|||||////||||||/////|||//////||||||///||/|||//////||||||////|||||//////||||||||//||
        # ||/////||||||||||||||//||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||/////||
        # |||||||||||||||||||||//|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
        # ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
        # DO NOT REMOVE OR MODIFY THIS FILE. Edit ~/.config/home.nix and run home-manager switch instead.
        # ~/.config/sbos-prompt
        reset=`tput sgr0`
        green=`tput setaf 2`
        orange=`tput setaf 3`
        altBlack=`tput setaf 8`
        altOrange=`tput setaf 11`
        eddition=""
        echo "
        $altBlack||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
        ||$orange/////$altBlack||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||$orange/////$altBlack||
        ||$orange//$altBlack||||||||$orange/////$altBlack|||||||||||||||||||||||||||||||||||||||||||||$orange///////$altBlack|||||||||||||||||||||||||$orange//////$altBlack||||$orange//////$altBlack||||||||$orange//$altBlack||
        ||$orange//$altBlack||||||$orange//$altBlack|||||||||$orange//////$altBlack|||||$orange/////$altBlack|||||||$orange////$altBlack||||||$orange////$altBlack||||$orange//$altBlack||||$orange//$altBlack|||$orange/$altBlack||||$orange//$altBlack||||$orange/////$altBlack||||$orange//$altBlack||||$orange//$altBlack||$orange//$altBlack|||||||||||||$orange//$altBlack||
        ||$orange//$altBlack|||||||$orange/////$altBlack|||||$orange//$altBlack||||$orange/$altBlack|||||||||$orange//$altBlack|||$orange//$altBlack||||||||$orange//$altBlack||||$orange/$altBlack|||$orange///////$altBlack||||$orange/$altBlack||||$orange//$altBlack|||$orange//$altBlack||||||||$orange/$altBlack|||||$orange//$altBlack|||$orange//////$altBlack||||||||$orange//$altBlack||
        ||$orange//$altBlack||||||||||||$orange//$altBlack|||$orange//$altBlack||||$orange//$altBlack|||$orange///////$altBlack||$orange//$altBlack||||||||$orange////////$altBlack|||$orange//$altBlack||||$orange//$altBlack|||$orange/$altBlack||||$orange//$altBlack||||$orange/////$altBlack||||$orange/$altBlack|||||$altBlack//$altBlack||||||||$orange//$altBlack|||||||$orange//$altBlack||
        ||$orange//$altBlack||||||||||||$orange//$altBlack|||$orange//$altBlack||||$orange/$altBlack|||$orange//$altBlack||||$orange//$altBlack|||$orange//$altBlack||||||||$orange/$altBlack|||||||||$orange//$altBlack||||$orange//$altBlack|||$orange/$altBlack||||$orange//$altBlack||||||||$orange//$altBlack|||$orange//$altBlack||||$orange/$altBlack|||||||||$orange//$altBlack|||||||$orange//$altBlack||
        ||$orange//$altBlack|||||||$orange//////$altBlack||||$orange//////$altBlack|||||$orange////$altBlack||$orange/$altBlack|||||$orange////$altBlack||||||$orange/////$altBlack|||$orange//////$altBlack||||||$orange///$altBlack||$orange/$altBlack|||$orange//////$altBlack||||||$orange////$altBlack|||||$orange//////$altBlack||||||||$orange//$altBlack||
        ||$orange/////$altBlack||||||||||||||$orange//$altBlack||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||$orange/////$altBlack||
        |||||||||||||||||||||$orange//$altBlack|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
        ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||$reset
        "
        #curlie -fsSL "https://wttr.in/?0m" --max-time 1
        #echo "$altOrange Public IP: $reset"
        #curlie -fsSL "https://ifconfig.me" --max-time 1
        #echo ""
        echo  "$altOrange CPU: $reset"
        lscpu |rg "Model name:" | cut -c 34-10000
        echo  "$altOrange Disk Info: $reset"
        duf -style ascii -only local
        echo  "$altOrange Fish Says Hi: $reset"

      '';
      ".config/starship.toml".text =
      ''
        # ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
        # ||/////||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||/////||
        # ||//||||||||/////|||||||||||||||||||||||||||||||||||||||||||||///////|||||||||||||||||||||||||//////||||//////||||||||//||
        # ||//||||||//|||||||||//////|||||/////|||||||////||||||////||||//||||//|||/||||//||||/////||||//||||//||//|||||||||||||//||
        # ||//|||||||/////|||||//||||/|||||||||//|||//||||||||//||||/|||///////||||/||||//|||//||||||||/|||||//|||//////||||||||//||
        # ||//||||||||||||//|||//||||//|||///////||//||||||||////////|||//||||//|||/||||//||||/////||||/|||||//||||||||//|||||||//||
        # ||//||||||||||||//|||//||||/|||//||||//|||//||||||||/|||||||||//||||//|||/||||//||||||||//|||//||||/|||||||||//|||||||//||
        # ||//|||||||//////||||//////|||||////||/|||||////||||||/////|||//////||||||///||/|||//////||||||////|||||//////||||||||//||
        # ||/////||||||||||||||//||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||/////||
        # |||||||||||||||||||||//|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
        # ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
        # DO NOT REMOVE OR MODIFY THIS FILE. Edit ~/.config/home.nix and run home-manager switch instead.
        # ~/.config/starship.toml

        # Use custom format
        format = """
        [┌───>](bold green)$directory$username$hostname$nix_shell$cmd_duration
        [└─>](bold green)$shlvl$shell$battery """

        right_format = """
        $character
        $status
        $aws
        $cmake
        $cobool
        $conda
        $crystal
        $dart
        $deno
        $docker_context
        $dotnet
        $elixir
        $elm
        $erlang
        $gcloud
        $git_branch
        $git_commit
        $git_state
        $git_metrics
        $git_status
        $golang
        $helm
        $java
        $kubernetes
        $lua
        """

        # Wait 10 milliseconds for starship to check files under the current directory.
        scan_timeout = 1000
        command_timeout = 1000

        # Disable the blank line at the start of the prompt
        add_newline = false

        [aws]
        format = '[$symbol($profile )(\($region\) )]($style)'
        style = "bold blue"
        symbol = " "
        expiration_symbol = "X"

        [battery]
        full_symbol = " "
        charging_symbol = " "
        discharging_symbol = " "
        unknown_symbol = " "
        empty_symbol = " "
        format = "[$symbol$percentage]($style) "
        [[battery.display]]
        threshold = 10
        style = "bold red"


        [character]
        success_symbol = "[ ](bold green) "
        error_symbol = "[ ](bold red) "
        vicmd_symbol = "[ ](bold green) "

        [cmake]
        format = "[$symbol($version )]($style)"
        version_format = "v$raw"
        symbol = "△ "
        detect_extensions = []
        detect_files = ["CMakeLists.txt", "CMakeCache.txt"]
        detect_folders = []
        style = "bold blue"

        [cobol]
        symbol = " "
        format = "[$symbol($version )]($style)"
        version_format = "v$raw"
        style = "bold blue"
        detect_extensions = ["cbl", "cob", "CBL", "COB"]


        [cmd_duration]
        min_time = 500
        show_milliseconds = false
        format = " [$duration](bold yellow)"
        show_notifications = true
        min_time_to_notify = 1000

        [conda]
        truncation_length = 1
        symbol = "🅒 "
        style = "dimmed green"
        format = "[$symbol$environment]($style) "
        ignore_base = true

        [crystal]
        symbol = " "
        format = "[$symbol($version )]($style)"
        version_format = "v$raw"
        style = "bold red"
        detect_extensions = ["cr"]
        detect_files = ["shard.yml"]
        detect_folders = []

        [dart]
        format = "[$symbol($version )]($style)"
        version_format = "v$raw"
        symbol = " "


        [deno]
        format = "[$symbol($version )]($style)"
        version_format = "v$raw"
        symbol = " "
        detect_extensions = []
        detect_files = ["mod.ts", "mod.js", "deps.ts", "deps.js"]
        detect_folders = []
        style = "green bold"

        [directory]
        truncation_length = 8
        truncate_to_repo = true
        format = "[$path]($style)[$read_only]($read_only_style) "
        style = "bold cyan"
        read_only = " "
        read_only_style = "red"
        truncation_symbol = ".../"
        repo_root_style = " "
        home_symbol = "~"

        [docker_context]
        format = "[$symbol$context]($style) "
        symbol = " "
        only_with_files = true
        detect_extensions = []
        detect_files = ["docker-compose.yml", "docker-compose.yaml", "Dockerfile", "Containerfile"]
        detect_folders = []
        style = "blue bold"

        [dotnet]
        format = "[$symbol($version )]($style)"
        version_format = "v$raw"
        symbol = " "
        heuristic = true
        detect_extensions = ["csproj", "fsproj", "xproj"]
        detect_files = ["global.json", "project.json", "Directory.Build.props", "Directory.Build.targets", "Packages.props"]
        detect_folders = []
        style = "bold blue"

        [elixir]
        format = "[$symbol($version )]($style)"
        version_format = "v$raw"
        symbol = " "
        detect_extensions = []
        detect_files = ["mix.exs"]
        detect_folders = []
        style = "bold purple"

        [elm]
        format = "[$symbol($version )]($style)"
        version_format = "v$raw"
        symbol = " "
        detect_extensions = ["elm"]
        detect_files = ["elm.json", "elm-package.json", ".elm-version"]
        detect_folders = ["elm-stuff"]
        style = "cyan bold"

        [erlang]
        format = "[$symbol($version )]($style)"
        version_format = "v$raw"
        symbol = " "
        detect_extensions = []
        detect_files = ["rebar.config", "elang.mk"]
        detect_folders = []
        style = "bold red"

        [gcloud]
        format = '[$symbol$account(@$domain)(\($project\))]($style) '
        symbol = " "
        region_aliases = " "
        style = "bold blue"

        [git_branch]
        always_show_remote = false
        format = "[$symbol$branch]($style) "
        symbol = " "
        style = "bold purple"
        truncation_length = 4
        truncation_symbol = "…"
        only_attached = false

        [git_commit]
        commit_hash_length = 7
        format = "[\\($hash$tag\\)]($style) "
        style = "bold green"
        only_detached = true
        tag_disabled = false
        tag_symbol = "🏷  "

        [git_state]
        rebase = "REBASING"
        merge = " "
        revert = "REVERTING"
        cherry_pick = " "
        bisect = "BISECTING"
        am = "AM"
        am_or_rebase = "AM/REBASE"
        style = "bold yellow"
        format = '\([$state( $progress_current/$progress_total)]($style)\) '

        [git_metrics]
        added_style = "bold green"
        deleted_style = "bold red"
        only_nonzero_diffs = true
        format = '([+$added]($added_style) )([-$deleted]($deleted_style) )'
        disabled = false

        [git_status]
        conflicted = "= "
        ahead = "⇡$count "
        behind = "⇣$count "
        diverged = "⇕⇡$ahead_count⇣$behind_count "
        up_to_date = " "
        untracked = "? "
        stashed = "📦 "
        modified = "繁  "
        staged = "+"
        renamed = "»"
        deleted = "🗑 "
        style = "bold red"

        [golang]
        format = "[$symbol($version )]($style)"
        version_format = "v$raw"
        symbol = " "
        detect_extensions = ["go"]
        detect_files = ["go.mod", "go.sum", "glide.yaml", "Gopkg.yml", "Gopkg.lock", ".go-version"]
        detect_folders = ["Godeps"]
        style = "bold blue"

        [helm]
        format = "[$symbol($version )]($style)"
        version_format = "v$raw"
        symbol ="⎈ "
        detect_extensions = []
        detect_files = ["helmfile.yaml", "Chart.yaml"]
        detect_folders = []
        style = "bold white"

        [hostname]
        ssh_only = false
        trim_at = "."
        format =  "[@ $hostname](bold red) "
        style = "bold dimmed green"

        [java]
        format = "[$symbol($version )]($style)"
        version_format = "v$raw"
        symbol = " "
        detect_extensions = ["java", "class", "gradle", "jar", "cljs", "cljc"]
        detect_files = ["pom.xml", "build.gradle.kts", "build.sbt", ".java-version", ".deps.edn", "project.clj", "build.boot"]
        detect_folders = []
        style = "red dimmed"

        [kotlin]
        format = "[$symbol($version )]($style)"
        version_format = "v$raw"
        symbol = "🅺 "
        detect_extensions = ["kt", "kts"]
        detect_files = []
        detect_folders = []
        style = "bold blue"

        [kubernetes]
        symbol = "☸ "
        format = '[$symbol$context( \($namespace\))]($style) in '
        style = "cyan bold"
        [kubernetes.context_aliases]
            "dev.local.cluster.k8s" = "dev"
            ".*/openshift-cluster/.*" = "openshift"
            "gke_.*_(?P<cluster>[\\w-]+)" = "gke-$cluster"
        disabled = false


        [nix_shell]
        format = ' [$state( \($name\))]($style) '
        disabled = false
        impure_msg = "[ ](bold red)"
        pure_msg = "[ ](bold green)"

        [lua]
        format = "[$symbol($version )]($style)"
        version_format = "v$raw"
        symbol = " "
        detect_extensions = ["lua"]
        detect_files = [".lua-version"]
        detect_folders = ["lua"]
        style = "bold blue"
        lua_binary = "lua"

        [hg_branch]
        format = "[$symbol$branch]($style) "

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

        [zig]
        symbol = "⚡️ "

        [vlang]
        format = "[V $version](blue bold) "

        [terraform]
        format = "[ $workspace]($style) "

        [swift]
        format = "[  $version](red bold)"


        [status]
        style = "bold red"
        format = '[\[$symbol $common_meaning$signal_name$maybe_int\]]($style) '
        map_symbol = true
        pipestatus = true
        disabled = false




        [username]
        style_user = "white bold"
        style_root = "red bold"
        format = "[$user]($style)  "
        show_always = true

        [shlvl]
        disabled = false

        [shell]
        fish_indicator = "  "
        powershell_indicator = " _ "
        bash_indicator = "  "
        unknown_indicator = "mystery shell"
        style = "cyan bold"
        disabled = false





      '';
      ".elvish/rc.elv".text =
      ''
        # ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
        # ||/////||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||/////||
        # ||//||||||||/////|||||||||||||||||||||||||||||||||||||||||||||///////|||||||||||||||||||||||||//////||||//////||||||||//||
        # ||//||||||//|||||||||//////|||||/////|||||||////||||||////||||//||||//|||/||||//||||/////||||//||||//||//|||||||||||||//||
        # ||//|||||||/////|||||//||||/|||||||||//|||//||||||||//||||/|||///////||||/||||//|||//||||||||/|||||//|||//////||||||||//||
        # ||//||||||||||||//|||//||||//|||///////||//||||||||////////|||//||||//|||/||||//||||/////||||/|||||//||||||||//|||||||//||
        # ||//||||||||||||//|||//||||/|||//||||//|||//||||||||/|||||||||//||||//|||/||||//||||||||//|||//||||/|||||||||//|||||||//||
        # ||//|||||||//////||||//////|||||////||/|||||////||||||/////|||//////||||||///||/|||//////||||||////|||||//////||||||||//||
        # ||/////||||||||||||||//||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||/////||
        # |||||||||||||||||||||//|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
        # ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
        # DO NOT REMOVE OR MODIFY THIS FILE. Edit ~/.config/home.nix and run home-manager switch instead.
        # ~/.elvish/rc.elv
        eval (starship init elvish)
        bash ~/.config/sbos-prompt
      '';
      ".config/ion/initrc".text =
      ''
        # ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
        # ||/////||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||/////||
        # ||//||||||||/////|||||||||||||||||||||||||||||||||||||||||||||///////|||||||||||||||||||||||||//////||||//////||||||||//||
        # ||//||||||//|||||||||//////|||||/////|||||||////||||||////||||//||||//|||/||||//||||/////||||//||||//||//|||||||||||||//||
        # ||//|||||||/////|||||//||||/|||||||||//|||//||||||||//||||/|||///////||||/||||//|||//||||||||/|||||//|||//////||||||||//||
        # ||//||||||||||||//|||//||||//|||///////||//||||||||////////|||//||||//|||/||||//||||/////||||/|||||//||||||||//|||||||//||
        # ||//||||||||||||//|||//||||/|||//||||//|||//||||||||/|||||||||//||||//|||/||||//||||||||//|||//||||/|||||||||//|||||||//||
        # ||//|||||||//////||||//////|||||////||/|||||////||||||/////|||//////||||||///||/|||//////||||||////|||||//////||||||||//||
        # ||/////||||||||||||||//||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||/////||
        # |||||||||||||||||||||//|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
        # ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
        # DO NOT REMOVE OR MODIFY THIS FILE. Edit ~/.config/home.nix and run home-manager switch instead.
        # ~/.config/ion/initrc
        eval $(starship init ion)
        bash ~/.config/sbos-prompt
      '';
      ".config/sbos-sync".text =
      ''
        # ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
        # ||/////||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||/////||
        # ||//||||||||/////|||||||||||||||||||||||||||||||||||||||||||||///////|||||||||||||||||||||||||//////||||//////||||||||//||
        # ||//||||||//|||||||||//////|||||/////|||||||////||||||////||||//||||//|||/||||//||||/////||||//||||//||//|||||||||||||//||
        # ||//|||||||/////|||||//||||/|||||||||//|||//||||||||//||||/|||///////||||/||||//|||//||||||||/|||||//|||//////||||||||//||
        # ||//||||||||||||//|||//||||//|||///////||//||||||||////////|||//||||//|||/||||//||||/////||||/|||||//||||||||//|||||||//||
        # ||//||||||||||||//|||//||||/|||//||||//|||//||||||||/|||||||||//||||//|||/||||//||||||||//|||//||||/|||||||||//|||||||//||
        # ||//|||||||//////||||//////|||||////||/|||||////||||||/////|||//////||||||///||/|||//////||||||////|||||//////||||||||//||
        # ||/////||||||||||||||//||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||/////||
        # |||||||||||||||||||||//|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
        # ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
        # DO NOT REMOVE OR MODIFY THIS FILE. Edit ~/.config/home.nix and run home-manager switch instead.
        # ~/.config/sbos-sync
        reset=`tput sgr0`
        green=`tput setaf 2`
        orange=`tput setaf 3`
        altBlack=`tput setaf 8`
        altOrange=`tput setaf 11`
        eddition=""
        echo "
        $altBlack||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
        ||$orange/////$altBlack||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||$orange/////$altBlack||
        ||$orange//$altBlack||||||||$orange/////$altBlack|||||||||||||||||||||||||||||||||||||||||||||$orange///////$altBlack|||||||||||||||||||||||||$orange//////$altBlack||||$orange//////$altBlack||||||||$orange//$altBlack||
        ||$orange//$altBlack||||||$orange//$altBlack|||||||||$orange//////$altBlack|||||$orange/////$altBlack|||||||$orange////$altBlack||||||$orange////$altBlack||||$orange//$altBlack||||$orange//$altBlack|||$orange/$altBlack||||$orange//$altBlack||||$orange/////$altBlack||||$orange//$altBlack||||$orange//$altBlack||$orange//$altBlack|||||||||||||$orange//$altBlack||
        ||$orange//$altBlack|||||||$orange/////$altBlack|||||$orange//$altBlack||||$orange/$altBlack|||||||||$orange//$altBlack|||$orange//$altBlack||||||||$orange//$altBlack||||$orange/$altBlack|||$orange///////$altBlack||||$orange/$altBlack||||$orange//$altBlack|||$orange//$altBlack||||||||$orange/$altBlack|||||$orange//$altBlack|||$orange//////$altBlack||||||||$orange//$altBlack||
        ||$orange//$altBlack||||||||||||$orange//$altBlack|||$orange//$altBlack||||$orange//$altBlack|||$orange///////$altBlack||$orange//$altBlack||||||||$orange////////$altBlack|||$orange//$altBlack||||$orange//$altBlack|||$orange/$altBlack||||$orange//$altBlack||||$orange/////$altBlack||||$orange/$altBlack|||||$altBlack//$altBlack||||||||$orange//$altBlack|||||||$orange//$altBlack||
        ||$orange//$altBlack||||||||||||$orange//$altBlack|||$orange//$altBlack||||$orange/$altBlack|||$orange//$altBlack||||$orange//$altBlack|||$orange//$altBlack||||||||$orange/$altBlack|||||||||$orange//$altBlack||||$orange//$altBlack|||$orange/$altBlack||||$orange//$altBlack||||||||$orange//$altBlack|||$orange//$altBlack||||$orange/$altBlack|||||||||$orange//$altBlack|||||||$orange//$altBlack||
        ||$orange//$altBlack|||||||$orange//////$altBlack||||$orange//////$altBlack|||||$orange////$altBlack||$orange/$altBlack|||||$orange////$altBlack||||||$orange/////$altBlack|||$orange//////$altBlack||||||$orange///$altBlack||$orange/$altBlack|||$orange//////$altBlack||||||$orange////$altBlack|||||$orange//////$altBlack||||||||$orange//$altBlack||
        ||$orange/////$altBlack||||||||||||||$orange//$altBlack||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||$orange/////$altBlack||
        |||||||||||||||||||||$orange//$altBlack|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
        ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||$reset
        "


        ssh ${syncHosts[1]} -t mv ~/.config/nixpkgs/home.nix ~/.cache/home.nix.bak
        scp ~/.cache/home.nix.tmp ${syncHosts[1]}:~/.config/nixpkgs/home.nix
        ssh ${syncHosts[1]} -t home-manager switch
      '';
       ".tcshrc".text =
      ''
        # ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
        # ||/////||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||/////||
        # ||//||||||||/////|||||||||||||||||||||||||||||||||||||||||||||///////|||||||||||||||||||||||||//////||||//////||||||||//||
        # ||//||||||//|||||||||//////|||||/////|||||||////||||||////||||//||||//|||/||||//||||/////||||//||||//||//|||||||||||||//||
        # ||//|||||||/////|||||//||||/|||||||||//|||//||||||||//||||/|||///////||||/||||//|||//||||||||/|||||//|||//////||||||||//||
        # ||//||||||||||||//|||//||||//|||///////||//||||||||////////|||//||||//|||/||||//||||/////||||/|||||//||||||||//|||||||//||
        # ||//||||||||||||//|||//||||/|||//||||//|||//||||||||/|||||||||//||||//|||/||||//||||||||//|||//||||/|||||||||//|||||||//||
        # ||//|||||||//////||||//////|||||////||/|||||////||||||/////|||//////||||||///||/|||//////||||||////|||||//////||||||||//||
        # ||/////||||||||||||||//||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||/////||
        # |||||||||||||||||||||//|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
        # ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
        # DO NOT REMOVE OR MODIFY THIS FILE. Edit ~/.config/home.nix and run home-manager switch instead.
        # ~/.tcshrc
        eval `starship init tcsh`
        bash ~/.config/sbos-prompt
        '';
        ".xonshrc".text =
        ''
        # ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
        # ||/////||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||/////||
        # ||//||||||||/////|||||||||||||||||||||||||||||||||||||||||||||///////|||||||||||||||||||||||||//////||||//////||||||||//||
        # ||//||||||//|||||||||//////|||||/////|||||||////||||||////||||//||||//|||/||||//||||/////||||//||||//||//|||||||||||||//||
        # ||//|||||||/////|||||//||||/|||||||||//|||//||||||||//||||/|||///////||||/||||//|||//||||||||/|||||//|||//////||||||||//||
        # ||//||||||||||||//|||//||||//|||///////||//||||||||////////|||//||||//|||/||||//||||/////||||/|||||//||||||||//|||||||//||
        # ||//||||||||||||//|||//||||/|||//||||//|||//||||||||/|||||||||//||||//|||/||||//||||||||//|||//||||/|||||||||//|||||||//||
        # ||//|||||||//////||||//////|||||////||/|||||////||||||/////|||//////||||||///||/|||//////||||||////|||||//////||||||||//||
        # ||/////||||||||||||||//||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||/////||
        # |||||||||||||||||||||//|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
        # ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
        # DO NOT REMOVE OR MODIFY THIS FILE. Edit ~/.config/home.nix and run home-manager switch instead.
        # ~/.xonshrc
        execx($(starship init xonsh))
        bash ~/.config/sbos-prompt
        '';
    };  

    activation = {
     myActivationAction = ''
        bash ~/.config/sbos-sync
       '';
    };
  };
}



