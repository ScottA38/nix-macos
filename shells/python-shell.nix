# python-shell.nix
{ pkgs }:
let
  pythonDeps = import ./python-deps.nix { inherit pkgs; };
  base = import ./base.nix { inherit pkgs; deps = [pythonDeps]; };
in
base // {
  name = "python-dev";
  description = "Python development environment";
}
