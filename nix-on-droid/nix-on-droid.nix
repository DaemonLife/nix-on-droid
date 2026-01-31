{ config, lib, pkgs, ... }:

{
  # Simply install just the packages
  environment.packages = with pkgs; [
    git
    vim
    nano
    yazi
    procps
    killall
    openssh
    diffutils
    findutils
    utillinux
    tzdata
    hostname
    man
    gnugrep
    gawk
    gnupg
    gnused
    gnutar
    bzip2
    gzip
    xz
    zip
    unzip
    which
    iproute2
  ];

  terminal.colors = {
    background = "#ffffff";
    foreground = "#000000";
    cursor = "#ebdbb2";
    color0 = "#282828";
    color1 = "#cc241d";
    # ... color2 through color15
  };

  environment.motd = ''
    Hello!
  '';

  user = {
    shell = "${pkgs.zsh}/bin/zsh";
  };

  android-integration = {
    am.enable = true;
    termux-open.enable = true;
    termux-open-url.enable = true;
    termux-setup-storage.enable = true;
    termux-reload-settings.enable = true;
    termux-wake-lock.enable = true;
    termux-wake-unlock.enable = true;
    xdg-open.enable = true;
  };

  # Backup etc files instead of failing to activate generation if a file already exists in /etc
  environment.etcBackupExtension = ".bak";

  # Read the changelog before changing this value
  system.stateVersion = "24.05";

  # Set up nix for flakes
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  # Set your time zone
  time.timeZone = "Europe/Moscow";

  # Configure home-manager
  home-manager = {
    config = ./home.nix;
    backupFileExtension = "hm-bak";
    useGlobalPkgs = true;
  };

}
