# compose.nix
{ pkgs, modules }:
let
  deps = map (module: import module { inherit pkgs; }) modules;
  base = import ./base.nix { inherit pkgs; inherit deps; };
in
base