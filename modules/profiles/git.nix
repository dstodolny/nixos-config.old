{ config, lib, pkgs, ... }:

with lib;
let
  secrets = import ../../secrets.nix;
  cfg = config.profiles.git;
in
{
  options = {
    profiles.git = {
      enable = mkOption {
        default = false;
        description = "Enable git profile";
        type = types.bool;
      };
    };
  };
  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      git
    ];
    environment.etc."gitconfig" = rec {
      text = ''
  [alias]
    co = checkout
    st = status
    ci = commit --signoff
    ca = commit --amend
    b = branch --color -v
    br = branch
    unstage = reset HEAD
  [color]
    branch = auto
    diff = auto
    status = auto
  [color "branch"]
    current = cyan reverse
    local = cyan
    remote = green
  [color "diff"]
    meta = white reverse
    frag = magenta reverse
    old = red
    new = green
  [color "status"]
    added = green
    changed = yellow
    untarcked = red
  [push]
    default = matching
  [user]
    name = ${secrets.git.name}
    email = ${secrets.git.email}
      '';
    };
  };
}