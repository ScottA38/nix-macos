# devops-shell.nix
{ pkgs }:
let
  # For now, devops just uses base packages
  base = import ./base.nix { inherit pkgs; deps = []; };
in
base // {
  name = "devops";
  description = "DevOps development environment";
}
