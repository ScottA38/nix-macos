{ pkgs, ... }:

let
  base = import ./base.nix { inherit pkgs; };
in
{
  name = "node-dev";
  description = "A node-specific toolchain";

  packages =
    base.packages
    ++ (with pkgs; [
      nodejs
      yarn
    ]);
}
