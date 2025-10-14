{ pkgs, ... }:

let
  base = import ./base.nix { inherit pkgs; };
in
{
  name = "devops";
  description = "Common cli commands for DevOps functions";

  buildInputs =
    base.buildInputs
    ++ (with pkgs; [
      go
      hugo
      dart-sass
    ]);
}
