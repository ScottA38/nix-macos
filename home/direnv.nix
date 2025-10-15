{ pkgs, ... }:

{
  programs.direnv = {
    enable = true;
    enableZshIntegrations = true;
    nix-direnv.enable;
  }
}
