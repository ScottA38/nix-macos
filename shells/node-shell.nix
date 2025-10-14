{ pkgs, ... }:

let
  base = import ./base.nix { inherit pkgs; }; 
in
  { 
    name = "node-dev";
    description = "A node-specific toolchain";

    buildInputs = base.buildInputs ++ (with pkgs; [
      nodejs
      yarn
    ]);
  }
