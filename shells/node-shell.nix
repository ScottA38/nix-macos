# node-shell.nix
{ pkgs }:
let
  nodeDeps = import ./node-deps.nix { inherit pkgs; };
  base = import ./base.nix { inherit pkgs; deps = [nodeDeps]; };
in
base // {
  name = "node-dev";
  description = "Node.js development environment";
}
