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
    home.file.".config/qtfile".source = ./config/qtile;
    home.file.".config/nvim".source = ./config/nvim;

    home.sessionPath = [
      "$HOME/.local/bin"
];

    home.packages = with pkgs; [
        neovim
        ripgrep
        nil
        nixfmt-rfc-style
        nodejs
        gcc
        jdk21
        android-tools
        kotlin

        fastfetch 
        waybar
        hyfetch
        tty-clock
        cmatrix
        xdg-user-dirs
        thunar
        vscode
        mesa-demos
        kcc
        p7zip
        file-roller
        feh
        unar
        zip
        # ani-cli (no sirves, tonto)
        mpv
        yt-dlp
        openssl
        fzf
        calibre
        rofi
        busybox
        pulseaudio
        pavucontrol
        zenity
        unzip
        osu-lazer
        flutter
    ];
}
