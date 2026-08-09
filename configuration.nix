
{ config, lib, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  nixpkgs.config.allowUnfree = true;

  networking.hostName = "nixos-btw"; # Define your hostname.

  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Monterrey";

  # Enable the X11 windowing system.
  # services.xserver.enable = true;
  services.xserver = {
	  enable =true;
	  autoRepeatDelay = 200;
	  autoRepeatInterval= 35;
	  windowManager.qtile.enable = true;
  };
  services.displayManager.ly.enable = true;
  
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  services.printing = {
    enable = true;
    drivers = with pkgs; [
      hplip
      splix
      cups-filters
    ];
  };

  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

  hardware.graphics.extraPackages = with pkgs; [
    intel-media-driver
    intel-vaapi-driver
  ];

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.matyazy = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      tree
    ];
  };

  programs.firefox.enable = true;

  services.flatpak.enable = true;

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
    ];

    config.common.defailt = "gtk";
  };

  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
  	git
	  kitty
	  alacritty
	  flatpak
    jmtpfs
    pcmanfm
    libmtp
    android-file-transfer
    vscodium
  ];

  programs.nix-ld.enable = true;

  programs.nix-ld.libraries = with pkgs; [
    stdenv.cc.cc
    zlib
    openssl
    libX11
    libXext
    libXrender
    libXrandr
    libXi
    libXcursor
    libXinerama
    libXfixes
    libGL
    alsa-lib
    pulseaudio
    openal
    SDL2
    libogg
    libvorbis
    flac
    mpg123
  ];

  boot.supportedFilesystems = [ "fuse" ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    font-awesome
  ]; 

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "26.05"; # Did you read the comment?

}

