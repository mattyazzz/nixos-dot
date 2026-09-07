{ config, pkgs, ... }:


{
    home.username = "matyazy";
    home.homeDirectory = "/home/matyazy";
    programs.git.enable = true;
    home.stateVersion = "26.05";
    programs.bash = {
        enable = true;
        shellAliases = {
            btw = "echo I use nixos, btw";
            fast = "clear && hyfetch";
            volume = "wpctl set-volume @DEFAULT_AUDIO_SINK@";

            op-home = "command nvim ~/nixos-dotfiles/home.nix";
            op-config = "command nvim ~/nixos-dotfiles/configuration.nix";
            op-flake = "command nvim ~/nixos-dotfiles/flake.nix";
        };
    };
    
    home.sessionPath = [
      "$HOME/.local/bin"
    ];

    home.pointerCursor = {
        gtk.enable = true;
        x11.enable = true;

        package = pkgs.bibata-cursors;
        name = "Bibata-Modern-Ice";
        size = 24;
    };

    home.packages = with pkgs; [
        # ====[ Dev ]===========
        neovim
        ripgrep
        nil
        nixfmt-rfc-style
        nodejs
        gcc
        jdk21
        vscode
        openssl
        fzf

        # ====[ Larp/Fun ]======
        fastfetch
        tty-clock
        cmatrix
        hyfetch
        tetris

        # ====[ Desktop ]=======
        waybar
        rofi
        xdg-user-dirs
        thunar
        zenity

        # ====[ Audio ]=========
        pavucontrol

        # ====[ Media ]=========
        mpv
        yt-dlp
        calibre

        # ====[ Utils ]=========
        file-roller
        unar
        busybox

        # ====[ Games ]=========
        osu-lazer

        # ====[ Graphics ]======
        mesa-demos
        feh
        # ====[ Fonts ]=========
        corefonts
        
        
        kcc
        # ani-cli (no sirves, tonto)
        
    ];
}
