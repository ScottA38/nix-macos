{ pkgs, ... }:

let
  base = import ./base.nix { inherit pkgs; }; 
in
  { 
    name = "python-dev";
    description = "A python-specific toolchain";

    packages = base.packages ++ (with pkgs; [
      (pkgs.python3.withPackages (python-pkgs: [
        python-pkgs.tkinter
      ]));
    ]);
  }
