{ config, lib, pkgs, ... }:

with lib;
let
  cfg = config.profiles.base;
  secrets = import ../../secrets.nix;
in
{
  options = {
    profiles.base = {
      enable = mkOption {
        default = true;
        description = "Enable base profile";
        type = types.bool;
      };
    };
  };

  config = mkIf cfg.enable {

    # Move to profiles/cron?
    services.locate.enable = true;
    services.locate.interval = "00 12 * * *";

    environment = {
      systemPackages = with pkgs; [
        curl
        gnumake
        openssl
        stow
        vim
        wget
      ];
    };
  };
}