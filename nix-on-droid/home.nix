{ config, lib, pkgs, ... }:

{
  imports = [
    ./zsh.nix
    # ./nixvim.nix
  ];
  home.stateVersion = "24.05";

  # insert home-manager config
}
