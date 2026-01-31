{ config, lib, pkgs, ... }:

{
  imports = [
    ./zsh.nix
    # ./nixvim.nix
  ];

  # sshd config
  # you need run ssh-keygen
  # then create ~/.ssh/authorized_keys and add a public key
  # run SSHD
  home.file.".config/sshd/sshd_config".text = ''
    HostKey /data/data/com.termux.nix/files/home/.ssh/id_ed25519
    Port 8022
  '';
  
  # do not change
  home.stateVersion = "24.05";
}
