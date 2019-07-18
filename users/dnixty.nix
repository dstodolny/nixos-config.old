{ config, lib, pkgs, ... }:
with lib;

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.dnixty = {
    isNormalUser = true;
    group = "users";
    createHome = true;
    home = "/home/dnixty";
    uid = 1000;
    extraGroups = [
      "wheel"
      "video"
      "audio"
      "nitrokey"
      "networkmanager"
    ];

  # openssh.authorizedKeys.keys = secret.sshKeys.yeah;
  };

  system.activationScripts =
  {
    # Configure dotfiles.
    dotfiles = stringAfter [ "users" "groups" ]
    ''
      cd /home/dnixty
    '';
  };
}