{
  description = "Scott'so nix-darwin system flake";

  inputs = {
    # monorepo w/ recipes ("derivations")
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    # system-level software and settings (macOS)
    darwin.url = "github:lnl7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";

    nix-homebrew.url = "github:zhaofengli/nix-homebrew";

    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      self,
      darwin,
      nixpkgs,
      flake-utils,
      nix-homebrew,
      ...
    }@inputs:
    let
      primaryUser = "srmes";
      pkgs = nixpkgs;
      pkg-config = {
        allowUnfree = true;
      };
      system = "aarch64-darwin";
    in
    {
      darwinConfigurations."Scotts-MacBook-Pro" = darwin.lib.darwinSystem {
        inherit system;
        modules = [
          ./darwin
          ./hosts/srmes-laptop/configuration.nix
        ];
        specialArgs = { inherit inputs self primaryUser; };
      };
      formatter.${system} = nixpkgs.legacyPackages.${system}.nixfmt-rfc-style;
    }
    // flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs {
          inherit system pkg-config;
          overlays = [ ];
        };

        inherit (pkgs) lib;
        nodeShell = import ./shells/node-shell.nix { inherit pkgs; };
        devopsShell = import ./shells/devops-shell.nix { inherit pkgs; };
        pythonShell = import ./shells/python-shell.nix { inherit pkgs; };
      in
      {
        devShells = {
          node = pkgs.mkShell nodeShell;
          devops = pkgs.mkShell devopsShell;
          python = pkgs.mkShell pythonShell;
        };
      }
    );
}
