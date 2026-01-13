{ pkgs, ... }:

let
  base = import ./base.nix { inherit pkgs; };
in
{
  name = "devops";
  description = "Common cli commands for DevOps functions";

  packages =
    base.packages
    ++ (with pkgs; [
      go
      hugo
      dart-sass
      php82
    ]);
}
