{ pkgs, ... }:

let
  base = import ./base.nix { inherit pkgs; }; 
  amplifyPkg = (npmPackage.lib.${pkgs.system}.npmPackage {
    name = "aws-amplify";
    packageName = "aws-amplify/amplify-js";
  })
in
  { 
    name = "devops";
    description = "Common cli commands for DevOps functions";

    buildInputs = base.buildInputs ++ (with pkgs; [
      gh
      awscli2
      amplifyPkg
    ]);
  }
